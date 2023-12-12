package infrastructure

import "time"

type TimeService interface {
	NowUTC() time.Time
}

type timeService struct{}

func NewTimeService() TimeService {
	return &timeService{}
}

func (t *timeService) NowUTC() time.Time {
	return time.Now().UTC()
}
