package sm

import "back/internal/pkg/domain/sync/domain"

type StateMachine interface {
	OnChangeNotification(domain.ChangeNotification) (StateMachine, bool)
	OnClientMessage(message domain.ClientMessage) (StateMachine, bool)
	PoolData() Update
}

func NewStateMachine() StateMachine {
	return &handShake{}
}

type Update struct {
	Messages []domain.ClientMessage
	NewState StateMachine
	Sane     bool
}
