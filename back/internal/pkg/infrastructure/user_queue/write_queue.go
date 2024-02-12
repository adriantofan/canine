package user_queue

import (
	"back/internal/app/rt"
	"context"
	"encoding/json"
	"fmt"

	"github.com/redis/go-redis/v9"
)

type WriteQueue struct {
	client *redis.Client
}

func NewWriteQueue(client *redis.Client) *WriteQueue {
	return &WriteQueue{client}
}

// Enqueue implements infrastructure.WriteQueue interface using redis pub/sub
func (u *WriteQueue) Enqueue(ctx context.Context, userID int64, msg rt.ServerMessage) error {
	data, err := json.Marshal(msg)
	if err != nil {
		// This is a 500 error
		return fmt.Errorf("programming error: failed to marshal data update: %w", err)
	}
	p := u.client.Publish(ctx, userQueueName(userID), data)
	if err = p.Err(); err != nil {
		return err
	}
	return nil
}
