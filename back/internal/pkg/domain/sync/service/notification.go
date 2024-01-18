package service

import (
	"back/internal/pkg/domain/sync/domain"
)

type Notification struct {
	notifications chan domain.ChangeNotification
}

func (q *Notification) Notifications() <-chan domain.ChangeNotification {
	return q.notifications
}

func (q *Notification) SendSyncProducer() <-chan bool {
	out := make(chan bool, 1)
	go func() {
		out <- true
	}()

	return out
}
