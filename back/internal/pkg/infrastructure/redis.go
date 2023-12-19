package infrastructure

import (
	"back/internal/pkg/domain"
	"context"
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

func (u *UpdateNotifier) NotifyUpdateMessage(ctx context.Context, message domain.Message) error {

	data, err := message.MarshallDataUpdate()
	if err != nil {
		return domain.MakeFailedUpdate(err)
	}
	p := u.client.Publish(ctx, PubSubChannelSSE, data)
	err = p.Err()
	if err != nil {
		return domain.MakeFailedUpdate(err)
	}
	return nil
}
