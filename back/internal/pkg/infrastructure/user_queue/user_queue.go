package user_queue

import (
	"back/internal/app/rt"
	"context"
	"encoding/json"
	"log"

	"github.com/redis/go-redis/v9"
)

type ReadQueue struct {
	client *redis.Client
}

func NewUserReadQueue(client *redis.Client) *ReadQueue {
	return &ReadQueue{client}
}

// Messages implements infrastructure.ReadQueue interface using redis pub/sub
func (u *ReadQueue) Messages(ctx context.Context, userID int64) (<-chan rt.ServerMessage, error) {
	channel := userQueueName(userID)
	pubsub := u.client.Subscribe(ctx, channel)
	pubsubChan := pubsub.Channel()
	return convertToServerMessageChan(pubsubChan), nil

}

func convertToServerMessageChan(pubsubChan <-chan *redis.Message) <-chan rt.ServerMessage {
	serverMessageChan := make(chan rt.ServerMessage)
	go func() {
		for msg := range pubsubChan {
			serverMessage := rt.ServerMessage{}
			err := json.Unmarshal([]byte(msg.Payload), &serverMessage)
			// something was enqueued incorrectly
			if err != nil {
				log.Printf("failed to unmarshal pubsub message: %v", err)
			}
			serverMessageChan <- serverMessage
		}
	}()
	return serverMessageChan
}
