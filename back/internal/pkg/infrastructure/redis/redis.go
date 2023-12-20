package redis

import (
	"back/internal/pkg/domain"
	"context"
	"encoding/json"
	"fmt"
	"github.com/redis/go-redis/v9"
)

// NewRedisClient creates a new redis client
// dsn format example: "redis://localhost:6379/0?protocol=3"
func NewRedisClient(dsn string) *redis.Client {
	opts, err := redis.ParseURL(dsn)
	if err != nil {
		panic(err)
	}

	client := redis.NewClient(opts)
	pingErr := client.Ping(context.Background()).Err()
	if pingErr != nil {
		panic(pingErr)
	}
	return client
}

const (
	PubSubChannelSSE = "sse"
)

type UpdateNotifier struct {
	client *redis.Client
}

func NewUpdateNotifier(client *redis.Client) *UpdateNotifier {
	return &UpdateNotifier{client}
}

func (u *UpdateNotifier) Notify(ctx context.Context, dataUpdate domain.DataUpdate) error {

	data, err := json.Marshal(dataUpdate)
	if err != nil {
		// This is a 500 error
		return fmt.Errorf("programming error: failed to marshal data update: %w", err)
	}
	p := u.client.Publish(ctx, PubSubChannelSSE, data)
	err = p.Err()
	if err != nil {
		return err
	}
	return nil
}
