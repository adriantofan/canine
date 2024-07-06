package notification

import (
	"back/internal/pkg/notification/payloads"
	"context"
	"encoding/json"
	"fmt"

	"cloud.google.com/go/pubsub"
)

type Publisher interface {
	NotifyMessage(
		ctx context.Context,
		payload *payloads.NotificationMessage,
	) error
}

// PubSubPublisher is a Publisher that sends messages to a Pub/Sub topic. A smarter implementation would not block
// and store failed messages for later retry. For a grateful shutdown, it would also wait for all messages to be sent.
// or store them with another mechanism for later retry.
type PubSubPublisher struct {
	emailTopic *pubsub.Topic
}

func NewPublisher(emailTopic string, client *pubsub.Client) *PubSubPublisher {
	topic := client.Topic(emailTopic)
	topic.EnableMessageOrdering = true
	return &PubSubPublisher{
		emailTopic: topic,
	}
}

func (p *PubSubPublisher) NotifyMessage(
	ctx context.Context,
	payload *payloads.NotificationMessage,
) error {

	data, err := json.Marshal(payload)
	if err != nil {
		return fmt.Errorf("failed to marshal email message %w", err)
	}

	result := p.emailTopic.Publish(ctx, &pubsub.Message{ //nolint:exhaustruct
		OrderingKey: fmt.Sprintf("%d-%d", payload.WorkspaceID, payload.ConversationID),
		Data:        data,
	})
	_, err = result.Get(ctx)
	if err != nil {
		return fmt.Errorf("failed to publish email message %w", err)
	}

	return nil
}
