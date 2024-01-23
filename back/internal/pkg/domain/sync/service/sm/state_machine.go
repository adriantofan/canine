package sm

import "back/internal/pkg/domain/sync/domain"

type StateMachine interface {
	OnChangeNotification(domain.ChangeNotification) (StateMachine, bool)
	OnClientMessage(message domain.ServerMessage) (StateMachine, bool)
	PoolData() Update
}

func NewStateMachine() StateMachine {
	return &handShake{}
}

type Update struct {
	Messages []domain.ServerMessage
	NewState StateMachine
	Sane     bool
}
