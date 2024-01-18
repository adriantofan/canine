package domain

import "back/internal/pkg/domain"

type notificationKind int

const (
	NotificationKindNA notificationKind = iota
	NotificationKindSync
	NotificationKindMessage
)

type ChangeNotification struct {
	SessionID string
	Kind      notificationKind
	data      interface{}
}

func (c *ChangeNotification) MustGetMessage() domain.Message {
	msg, ok := c.data.(domain.Message)
	if !ok {
		panic("invalid Message inside ChangeNotification")
	}

	return msg
}
