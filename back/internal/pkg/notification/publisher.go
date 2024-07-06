package notification

import (
	"back/.gen/canine/public/model"
	"back/internal/pkg/notification/payloads"
	"context"
	"encoding/json"
	"fmt"

	"cloud.google.com/go/pubsub"
)

type Publisher interface {
	NotifyMessage(
		ctx context.Context,
		workspaceID, conversationID, messageID int64,
		messageType model.MessageType,
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
	workspaceID, conversationID, messageID int64,
	messageType model.MessageType,
) error {
	msg := payloads.NotificationMessage{
		WorkspaceID:    workspaceID,
		ConversationID: conversationID,
		MessageID:      messageID,
		MessageType:    messageType,
	}
	data, err := json.Marshal(msg)
	if err != nil {
		return fmt.Errorf("failed to marshal email message %w", err)
	}

	result := p.emailTopic.Publish(ctx, &pubsub.Message{ //nolint:exhaustruct
		OrderingKey: fmt.Sprintf("%d-%d", workspaceID, conversationID),
		Data:        data,
	})
	_, err = result.Get(ctx)
	if err != nil {
		return fmt.Errorf("failed to publish email message %w", err)
	}

	return nil
}
