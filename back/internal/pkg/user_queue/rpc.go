package user_queue

import (
	"back/internal/pkg/rpc"
	"context"
)

type WriteQueue interface {
	Enqueue(ctx context.Context, userID int64, msg rpc.ServerMessage) error
}

type ReadQueue interface {
	// Messages returns channel of messages for user with userID
	// need to cancel context to stop receiving messages and to close channel
	// If the channel is locked for more than 1 minute the message is dropped
	// TODO: think about how to properly handle this
	Messages(ctx context.Context, userID int) (<-chan rpc.ServerMessage, error)
}
