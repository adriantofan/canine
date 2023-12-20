package infrastructure

import (
	"back/internal/pkg/domain"
	"context"
)

type UpdateNotifier interface {
	// NotifyUpdateMessage returns FailedUpdate if failed to notify
	Notify(ctx context.Context, dataUpdate domain.DataUpdate) error
}
