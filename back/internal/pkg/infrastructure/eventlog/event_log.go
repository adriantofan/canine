package eventlog

import (
	"context"
	"fmt"
	"log"
	"time"
)

const (
	kEventLogBufferThreshold = 30 * time.Second
)

/*
 Want to send to:
 1. Internal messages  - send to all internal users
 2. External message in a conversation with an external user - send to all internal users and the user
 3. A private message in a group of users (conversation with a group of users) - send to all users from the list
 4. Internal user changed - To everyone
*/

type ServerEventLog interface {
	// Write is a blocking call, goroutine safe
	Write(event Event) error
}

type ClientEvenLog interface {
	StreamEvents(WorkspaceID int64, UserID int64, startHash []byte) (func(), chan []Event)
}

// InMemoryEventLog contract
// First Run in a goroutine
// While running it is possible to Write events and to StreamEvents
// When stopping, first stop all Writers,
// Make sure that nobody is going to call StreamEvents.
// Finally, call Cancel, who is going to stop all ongoing StreamEvents
//
// THERE ARE NO SAFEGUARDS IN PLACE FOR THIS CONTRACT.
type InMemoryEventLog struct {
	events             map[int64][]Event
	running            bool
	inbox              chan Event
	stop               chan bool  // signal to stop
	didStop            chan error // signal that we stopped
	subscriptions      []Subscription
	subscriptionAdd    chan Subscription
	subscriptionRemove chan Subscription
}

type Subscription struct {
	outbox        chan []Event
	workspaceID   int64
	userID        int64
	broadcastMask maskType
	startHash     string
}

func NewInMemoryEventLog() *InMemoryEventLog {
	return &InMemoryEventLog{
		events:             make(map[int64][]Event),
		running:            false,
		inbox:              make(chan Event),
		stop:               make(chan bool),
		didStop:            make(chan error),
		subscriptions:      make([]Subscription, 0),
		subscriptionAdd:    make(chan Subscription, 1),
		subscriptionRemove: make(chan Subscription, 1),
	}
}

func (l *InMemoryEventLog) Run() {
	l.running = true
	ticker := time.NewTicker(1 * time.Second)
	for {
		select {
		case <-ticker.C:
			l.events = l.removeOldEvents(l.events)
		case e := <-l.inbox:
			l.storeAndDispatchNewEvent(e)
		case sub := <-l.subscriptionAdd:
			l.subscriptions = append(l.subscriptions, sub)
			sub.outbox <- l.getMissedEvents(sub.workspaceID, sub.userID, sub.broadcastMask, sub.startHash)
		case sub := <-l.subscriptionRemove:
			for i, s := range l.subscriptions {
				if s == sub {
					l.subscriptions = append(l.subscriptions[:i], l.subscriptions[i+1:]...)

					break
				}
			}
		case <-l.stop:
			ticker.Stop()
			l.running = false
			// cleanup (flush disk buffers, etc)
			for _, sub := range l.subscriptions {
				close(sub.outbox)
			}
			l.didStop <- nil

			return
		}
	}
}

func (l *InMemoryEventLog) storeAndDispatchNewEvent(e Event) {
	l.events[e.WorkspaceID] = append(l.events[e.WorkspaceID], e)
	for _, sub := range l.subscriptions {
		if e.WorkspaceID == sub.workspaceID && e.Destination.Match(sub.userID, sub.broadcastMask) {
			sub.outbox <- []Event{e}
		}
	}
}

func (l *InMemoryEventLog) StreamEvents(
	workspaceID, userID int64,
	broadcastMask maskType,
	startHash string,
) (func(), chan []Event) {
	if !l.running {
		log.Println("Should not stream events for a non running Event log")
	}
	outbox := make(chan []Event, 1)
	sub := Subscription{
		workspaceID:   workspaceID,
		userID:        userID,
		outbox:        outbox,
		startHash:     startHash,
		broadcastMask: broadcastMask,
	}
	l.subscriptionAdd <- sub

	return func() {
		l.subscriptionRemove <- sub
		close(outbox)
	}, outbox
}

// Includes events that are equal to startHash.
func (l *InMemoryEventLog) getMissedEvents(
	workspaceID, userID int64,
	broadcastMask maskType,
	startHash string) []Event {
	events, ok := l.events[workspaceID]
	if !ok {
		return []Event{}
	}
	for i, e := range events {
		if e.MarkerHash == startHash {
			return getEventsForUser(workspaceID, userID, broadcastMask, events[i:])
		}
	}

	return events
}

func getEventsForUser(workspaceID, userID int64, broadcastMask maskType, events []Event) []Event {
	result := make([]Event, 0, len(events))
	for _, e := range events {
		if e.WorkspaceID == workspaceID && e.Destination.Match(userID, broadcastMask) {
			result = append(result, e)
		}
	}

	return result
}

func (l *InMemoryEventLog) Stop(ctx context.Context) error {
	select {
	case l.stop <- true:
		break
	case <-ctx.Done():
		return fmt.Errorf("failed to stop event log: %w", ctx.Err())
	}
	select {
	case r := <-l.didStop:
		return r
	case <-ctx.Done():
		return fmt.Errorf("failed to stop event log: %w", ctx.Err())
	}
}

func (l *InMemoryEventLog) Write(event Event) {
	l.inbox <- event
}

// removeOldEvents removes events, assuming that the events are ordered by time
//
//	efficiently handles the case where there are no events to remove for a key
//	efficiently handles the case where there are much more events to keep than to remove
func (l *InMemoryEventLog) removeOldEvents(events map[int64][]Event) map[int64][]Event {
	threshold := time.Now().Add(-kEventLogBufferThreshold)
	for key, eventList := range events {
		var firstToKeep int
		for i, event := range eventList {
			if !isOlderThanThreshold(event.Time, threshold) {
				firstToKeep = i

				break
			}
		}
		// TODO: optimize finding the first event to keep
		// TODO: optimize number of deleted events vs number of kept events
		// Update the slice in the map to only include events to keep.
		// This is efficient because it reuses the underlying array.
		if firstToKeep == 0 {
			events[key] = []Event{}
		} else {
			events[key] = eventList[firstToKeep:]
			// This won't work because it might overwrite other events in other slices using
			// the same underlying array.
		}
	}

	return events
}

func isOlderThanThreshold(eventTime, threshold time.Time) bool {
	return eventTime.Before(threshold)
}
