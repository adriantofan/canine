package sm

import (
	"back/internal/pkg/domain/sync"
	"back/internal/pkg/domain/sync/domain"
)

type waitSyncState struct {
	buffer    []domain.ChangeNotification
	sessionID string
}

func newWaitSyncState(sessionID string) *waitSyncState {
	return &waitSyncState{
		buffer:    nil,
		sessionID: sessionID,
	}
}

func (s *waitSyncState) OnChangeNotification(notification domain.ChangeNotification) (StateMachine, bool) {
	if notification.SessionID != s.sessionID {
		return newWaitSyncState(s.sessionID), true
	}

	s.buffer = append(s.buffer, notification)
	return s, true
}

func (s *waitSyncState) OnClientMessage(message domain.ServerMessage) (StateMachine, bool) {
	if message.Kind != domain.ClientMessageKindSyncState {
		syncState := sync.MakeSyncState(message.MustGetInitialSyncState())
		return newInitialSync(s.sessionID, s.buffer, &syncState), true
	}
	return s, true
}

func (s *waitSyncState) PoolData() Update {
	return Update{
		Messages: nil,
		NewState: s,
		Sane:     true,
	}
}
