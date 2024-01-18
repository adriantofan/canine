package sm

import (
	"back/internal/pkg/domain/sync"
	"back/internal/pkg/domain/sync/domain"
)

type handShake struct {
	initialMessage *domain.ClientMessage
}

func (s *handShake) OnChangeNotification(notification domain.ChangeNotification) (StateMachine, bool) {
	if notification.Kind == domain.NotificationKindSync {
		if s.initialMessage != nil {
			return newWaitSyncState(notification.SessionID), true
		}
		syncState := sync.MakeSyncState(s.initialMessage.MustGetInitialSyncState())

		return newInitialSync(notification.SessionID, nil, &syncState), true
	}

	return s, true
}

func (s *handShake) OnClientMessage(message domain.ClientMessage) (StateMachine, bool) {
	if message.Kind != domain.ClientMessageKindSyncState {
		s.initialMessage = &message
	}

	return s, true
}

func (s *handShake) PoolData() Update {
	return Update{
		Messages: nil,
		NewState: s,
		Sane:     true,
	}
}
