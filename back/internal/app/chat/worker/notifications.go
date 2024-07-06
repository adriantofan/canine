package worker

import (
	"back/internal/pkg/domain/infrastructure/repository/postgres"
	"back/internal/pkg/env"
	"back/internal/pkg/infrastructure"
	"back/internal/pkg/notification"
	"back/internal/pkg/notification/payloads"
	"context"
	"os"
	"os/signal"
	"syscall"

	"cloud.google.com/go/pubsub"

	flag "github.com/spf13/pflag"

	"github.com/rs/zerolog/log"
)

func Run(args []string) {
	log.Debug().Msgf("Running workers with args: %v", args)
	flagSet := flag.NewFlagSet("api", flag.ExitOnError)
	dsn := flagSet.String("postgres-dsn", "", "database connection string")
	instanceConnectionName := flagSet.String("instance-connection-name", "", "cloud sql instance connection name, if any")
	logLevel := flagSet.String("log-level", "info", "log level: debug, info, warn, error, fatal, panic")
	structuredLog := flagSet.Bool("structured-log", true, "use structured log output")
	sendgridAPIKey := flagSet.String("sendgrid-api-key", "", "sendgrid api key")
	appURL := flagSet.String("app-url", "https://clemia.fr/app", "app url")
	senderEmail := flagSet.String("sender-email", "noreply@clemia.fr", "sender email")
	senderName := flagSet.String("sender-name", "Clemia", "sender name")
	pubsubNotificationSubscription := flagSet.String("pubsub-notification-subscription", "", "")
	pubsubNotificationTopic := flagSet.String("pubsub-notification-topic", "", "")
	pubsubNotificationProject := flagSet.String("pubsub-notification-project", "", "")
	twilioSid := flagSet.String("twilio-sid", "", "twilio sid")
	twilioAuthToken := flagSet.String("twilio-auth-token", "", "twilio auth token")
	twilioFromNumber := flagSet.String("twilio-from-number", "", "twilio from number")

	if err := env.SetFlagsFromEnvironment(flagSet); err != nil {
		log.Fatal().Err(err).Msg("failed to set flags from environment")
	}

	if err := flagSet.Parse(args); err != nil {
		log.Fatal().Err(err).Msg("failed to parse flags")
	}

	infrastructure.SetupLogger(*structuredLog, *logLevel)

	connexion, err := infrastructure.ConnectDB(*dsn, *instanceConnectionName)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to connect to db")
	}
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	transactionFactory := postgres.NewTransactionFactory(connexion)

	// TODO: need to script pubsub dev pubsub setup
	err = notification.SetupDev(ctx, *pubsubNotificationProject, *pubsubNotificationTopic, *pubsubNotificationSubscription)
	if err != nil {
		log.Panic().Err(err).Msg("failed to setup pubsub")
	}

	processor, err := notification.NewNotificationProcessor(
		*sendgridAPIKey,
		*appURL,
		*senderEmail,
		*senderName,
		*twilioSid,
		*twilioAuthToken,
		*twilioFromNumber,
		transactionFactory,
	)
	if err != nil {
		log.Panic().Err(err).Msg("failed to create email processor")
	}

	pubsubClient, err := pubsub.NewClient(ctx, *pubsubNotificationProject)
	if err != nil {
		log.Panic().Err(err).Msg("failed to create pubsub client")
	}
	worker := notification.NewWorker[payloads.NotificationMessage](
		*pubsubNotificationSubscription,
		pubsubClient,
		processor,
	)

	shutdown := make(chan os.Signal, 1)
	signal.Notify(shutdown, syscall.SIGINT, syscall.SIGTERM)
	go func() {
		log.Info().Msg("Worker running...")
		err = worker.Run(ctx)
		if err != nil {
			log.Fatal().Err(err).Msg("failed to run worker")
		}
	}()

	<-shutdown
	log.Printf("Shutodown signal received, shutting down...")
	cancel()
	log.Printf("Shutodown complete.")
}
