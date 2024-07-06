package notification

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"time"

	"github.com/rs/zerolog/log"

	"github.com/rs/zerolog"

	"cloud.google.com/go/pubsub"
)

type Processor[T any] interface {
	Send(ctx context.Context, data T) error
}

type Worker interface {
	Run(ctx context.Context)
}

type PubSubWorker[T any] struct {
	subscription *pubsub.Subscription
	processor    Processor[T]
}

func NewWorker[T any](subscription string, client *pubsub.Client, processor Processor[T]) *PubSubWorker[T] {
	sub := client.Subscription(subscription)
	// Set MinExtensionPeriod high to avoid any unintentional
	// acknowledgment expirations (e.g. due to network events).
	// This can lead to high tail latency in case of client crashes.
	sub.ReceiveSettings.MinExtensionPeriod = 600 * time.Second //nolint:gomnd

	return &PubSubWorker[T]{
		subscription: sub,
		processor:    processor,
	}
}

func (p PubSubWorker[T]) Run(ctx context.Context) error {
	err := p.subscription.Receive(ctx, func(ctx context.Context, msg *pubsub.Message) {
		var data T
		err := json.Unmarshal(msg.Data, &data)
		if err != nil {
			zerolog.Ctx(ctx).Error().Err(err).Msgf("failed to unmarshal message %+v", msg)
		}
		err = p.processor.Send(ctx, data)
		if err != nil {
			log.Ctx(ctx).Error().Err(err).Msgf("failed to process message %+v", msg)
			res := msg.NackWithResult()
			status, err := res.Get(ctx)
			if err != nil {
				zerolog.Ctx(ctx).Error().Err(err).Msgf("failed to nack message %+v", msg)

				return
			}

			if status != pubsub.AcknowledgeStatusSuccess {
				zerolog.Ctx(ctx).Error().Err(err).Msgf("failed to nack message %+v status %d", msg, status)
			}

			return
		}

		res := msg.AckWithResult()
		status, err := res.Get(ctx)
		if err != nil {
			zerolog.Ctx(ctx).Error().Err(err).Msgf("failed to ack message %+v", msg)

			return
		}

		if status != pubsub.AcknowledgeStatusSuccess {
			zerolog.Ctx(ctx).Error().Err(err).Msgf("failed to ack message %+v status %d", msg, status)
		}
	})
	if err != nil {
		return fmt.Errorf("failed to receive message %w", err)
	}

	return nil
}

func SetupDev(ctx context.Context, project, topic, subscription string) error {
	if os.Getenv("PUBSUB_EMULATOR_HOST") == "" {
		return nil
	}
	client, err := pubsub.NewClient(ctx, project)
	if err != nil {
		return fmt.Errorf("failed to create pubsub client %w", err)
	}
	t := client.Topic(topic)
	exists, err := t.Exists(ctx)
	if err != nil {
		return fmt.Errorf("failed to check topic %w", err)
	}
	if !exists {
		t, err = client.CreateTopic(ctx, topic)
		if err != nil {
			return fmt.Errorf("failed to create topic %w", err)
		}
	}

	s := client.Subscription(subscription)
	exists, err = s.Exists(ctx)
	if err != nil {
		return fmt.Errorf("failed to check subscription %w", err)
	}
	if !exists {
		s, err = client.CreateSubscription(ctx, subscription, pubsub.SubscriptionConfig{
			Topic:                 t,
			EnableMessageOrdering: true,
		})
		if err != nil {
			return fmt.Errorf("failed to create subscription %w", err)
		}
	}

	return nil
}
