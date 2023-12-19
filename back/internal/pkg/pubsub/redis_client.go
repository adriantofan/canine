package pubsub

import (
	"context"
	"encoding/json"
	"github.com/redis/go-redis/v9"
	"log"
)

type CloseFunc func() error
type PubSub[T any] interface {
	Subscribe(ctx context.Context, channel string) (CloseFunc, <-chan T)
	Publish(ctx context.Context, channel string, v T) error
}

type RedisClient[T any] struct {
	client *redis.Client
}

func (r RedisClient[T]) Publish(ctx context.Context, channel string, v T) error {
	b, err := json.Marshal(v)
	if err != nil {
		return err
	}
	return r.client.Publish(ctx, channel, string(b)).Err()
}

func (r RedisClient[T]) Subscribe(ctx context.Context, channel string) (CloseFunc, <-chan T) {
	pubsub := r.client.Subscribe(ctx, channel)
	outChan := make(chan T)
	go func() {
		for {
			select {
			case <-ctx.Done():
				return
			case msg, ok := <-pubsub.Channel():
				if !ok {
					close(outChan)
				}
				println("Got msg", msg.Channel, msg.Payload)
				var v T
				err := json.Unmarshal([]byte(msg.Payload), &v)
				if err != nil {
					log.Println("Failed to unmarshalling message", err)
					// TODO: Should it close the out channel?
				}
				outChan <- v
			}
		}

	}()

	return pubsub.Close, outChan
}
