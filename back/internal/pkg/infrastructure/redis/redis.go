package redis

import (
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
