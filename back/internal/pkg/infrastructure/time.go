package infrastructure

import "time"

type TimeService interface {
	NowUTC() time.Time
	Now() time.Time
}

type RealTimeService struct{}

func NewRealTimeService() *RealTimeService {
	return &RealTimeService{}
}

func (t *RealTimeService) NowUTC() time.Time {
	return time.Now().UTC()
}
func (t *RealTimeService) Now() time.Time {
	return time.Now()
}
