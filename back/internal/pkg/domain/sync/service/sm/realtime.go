package sm

import (
	"log"

	"back/internal/pkg/domain/sync"
	"back/internal/pkg/domain/sync/domain"
)

type realTime struct {
	buffer    []domain.ChangeNotification
	sessionID string
	syncState *sync.ClientSyncRepo
}

func newRealTime(sessionID string, buffer []domain.ChangeNotification, syncState *sync.ClientSyncRepo) *realTime {
	return &realTime{
		buffer:    buffer,
		sessionID: sessionID,
		syncState: syncState,
	}
}

func (s *realTime) PoolData() Update {
	panic("implement me")
}

func (s *realTime) OnChangeNotification(notification domain.ChangeNotification) (StateMachine, bool) {
	if notification.SessionID != s.sessionID {
		log.Printf("Sync session id changed, disconnecting to resync.")

		return s, false
	}

	s.buffer = append(s.buffer, notification)

	return s, true
}

func (s *realTime) OnClientMessage(_ domain.ServerMessage) (StateMachine, bool) {
	log.Printf("Client sent messages while server doesnt support any client messages")

	return s, true
}
