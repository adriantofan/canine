package eventlog_test

import (
	"context"
	"errors"
	"fmt"
	"time"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gleak"

	"back/internal/pkg/infrastructure/eventlog"
)

var _ = Describe("EventLog", func() {
	workspaceID1 := int64(1)
	iID1 := int64(1)
	eID1 := int64(2)
	errGotMoreElements := fmt.Errorf("got more elements")

	It("should be able to create a new event log", func() {
		eventLog := eventlog.NewInMemoryEventLog()
		go eventLog.Run()
		event1 := eventlog.MakeMarkerEvent(workspaceID1)
		event2 := eventlog.Event{
			WorkspaceID: workspaceID1,
			Destination: eventlog.MakeDestinationInternalMessage(),
			Time:        time.Now(),
			MarkerHash:  "hash0",
			Payload:     []byte("payload0"),
		}
		event3 := eventlog.MakeMarkerEvent(workspaceID1)
		event4 := eventlog.Event{
			WorkspaceID: workspaceID1,
			Destination: eventlog.MakeDestinationExternalMessage(eID1),
			Time:        time.Now(),
			MarkerHash:  "hash1",
			Payload:     []byte("payload1"),
		}
		event5 := eventlog.Event{
			WorkspaceID: workspaceID1,
			Destination: eventlog.MakeDestinationExternalMessage(eID1),
			Time:        time.Now(),
			MarkerHash:  "",
			Payload:     []byte("payload5"),
		}

		eventLog.Write(event1)
		eventLog.Write(event2)
		eventLog.Write(event3)
		eventLog.Write(event4)
		_, i1Chan := eventLog.StreamEvents(workspaceID1, iID1, eventlog.MaskBroadcastInternal, event1.MarkerHash)
		_, e1Chan := eventLog.StreamEvents(workspaceID1, eID1, eventlog.MaskBroadcastInternal, event3.MarkerHash)
		i1ResChan := make(chan error, 1)
		go func() {
			if ok, err := waitFor([]eventlog.Event{event1, event2, event3, event4}, i1Chan); !ok {
				i1ResChan <- fmt.Errorf("failed to get all events: %w", err)

				return
			}
			i1ResChan <- nil

			if ok, err := waitFor([]eventlog.Event{event5}, i1Chan); !ok {
				i1ResChan <- fmt.Errorf("failed to get event: %w", err)

				return
			}
			i1ResChan <- nil

			for range i1Chan {
				i1ResChan <- errGotMoreElements

				return
			}
			i1ResChan <- nil
		}()

		Expect(<-i1ResChan).ToNot(HaveOccurred())

		e1ResChan := make(chan error, 1)
		go func() {
			if ok, err := waitFor([]eventlog.Event{event3, event4}, e1Chan); !ok {
				e1ResChan <- fmt.Errorf("failed to get all events: %w", err)
			}
			e1ResChan <- nil

			if ok, err := waitFor([]eventlog.Event{event5}, e1Chan); !ok {
				e1ResChan <- fmt.Errorf("failed to get event: %w", err)
			}
			e1ResChan <- nil
			for range e1Chan {
				e1ResChan <- errGotMoreElements

				return
			}
			e1ResChan <- nil
		}()
		Expect(<-e1ResChan).ToNot(HaveOccurred())
		eventLog.Write(event5)
		Expect(<-i1ResChan).ToNot(HaveOccurred())
		Expect(<-e1ResChan).ToNot(HaveOccurred())

		e := eventLog.Stop(context.Background())
		Expect(e).ToNot(HaveOccurred())
		Expect(<-i1ResChan).ToNot(HaveOccurred())
		Expect(<-e1ResChan).ToNot(HaveOccurred())

	})
	AfterEach(func() {
		Eventually(gleak.Goroutines).ShouldNot(gleak.HaveLeaked())
	})

})

func waitFor(events []eventlog.Event, in chan []eventlog.Event) (bool, error) {
	var got []eventlog.Event
	for r := range in {
		got = append(got, r...)
		if len(got) > len(events) {
			return false, errors.New("got more events than expected")
		}
		for i := 0; i < min(len(got), len(events)); i++ {
			if got[i].MarkerHash != events[i].MarkerHash {
				return false, fmt.Errorf("event %d differs", i)
			}
		}
		if len(got) == len(events) {
			return true, nil
		}
	}

	return false, fmt.Errorf("channel closed")
}
