package sm

import (
	"context"
	"log"
	"time"

	"back/internal/pkg/domain/sync"

	"back/internal/pkg/domain/sync/domain"
)

type InitialSync struct {
	buffer    []domain.ChangeNotification
	sessionID string
	syncState *sync.ClientSyncRepo
}

func newInitialSync(sessionID string, buffer []domain.ChangeNotification, syncState *sync.ClientSyncRepo) *InitialSync {
	return &InitialSync{
		buffer:    buffer,
		sessionID: sessionID,
		syncState: syncState,
	}
}

func (s *InitialSync) OnChangeNotification(notification domain.ChangeNotification) (StateMachine, bool) {
	if notification.SessionID != s.sessionID {
		log.Printf("Sync session id changed, disconnecting to resync.")
		return s, false
	}

	s.buffer = append(s.buffer, notification)
	return s, true
}

func (s *InitialSync) OnClientMessage(_ domain.ServerMessage) (StateMachine, bool) {
	// is it possible to have a race condition at end of sync?
	log.Printf("Client sent messages while initial sync is not done")

	return s, false
}

func (s *InitialSync) PoolData() Update {
	timeout := 10 * time.Second
	ctx, cancel := context.WithTimeout(context.Background(), timeout)
	defer func() { cancel() }()
	conversations, err := s.syncState.GetMissingConversations(ctx)
	if err != nil {
		log.Printf("Failed to get conversations: %v", err)
		return Update{
			Messages: nil,
			NewState: s,
			Sane:     false,
		}
	}

	if len(conversations) != 0 {
		return Update{
			Messages: []domain.ServerMessage{domain.MakeClientMessageConversations(conversations)},
			NewState: s,
			Sane:     true,
		}
	}

	messages, err := s.syncState.GetMissingMessages(ctx)
	if err != nil {
		log.Printf("Failed to get messages: %v", err)
		return Update{
			Messages: nil,
			NewState: s,
			Sane:     false,
		}
	}

	if len(messages) != 0 {
		return Update{
			Messages: []domain.ServerMessage{domain.MakeClientMessageMessages(messages)},
			NewState: s,
			Sane:     true,
		}
	}
	return Update{
		Messages: nil,
		NewState: newRealTime(s.sessionID, s.buffer, s.syncState),
		Sane:     true,
	}
}
