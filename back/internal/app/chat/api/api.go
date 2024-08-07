package api

import (
	apiInternal "back/internal/pkg/api"
	"back/internal/pkg/app"
	"back/internal/pkg/auth/zitadel"
	"back/internal/pkg/domain/infrastructure/repository/postgres"
	domainServices "back/internal/pkg/domain/infrastructure/service"
	"back/internal/pkg/env"
	"back/internal/pkg/infrastructure"
	"back/internal/pkg/notification"
	"back/internal/pkg/rt/eventlog"
	"context"
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"os"
	"os/signal"
	"syscall"
	"time"

	"cloud.google.com/go/pubsub"

	zitadelManagement "github.com/zitadel/zitadel-go/v2/pkg/client/management"

	"github.com/zitadel/oidc/pkg/oidc"

	"github.com/zitadel/zitadel-go/v2/pkg/client/middleware"

	"github.com/rs/zerolog/log"

	flag "github.com/spf13/pflag"
	zitadelAdmin "github.com/zitadel/zitadel-go/v2/pkg/client/admin"
	zitadelClient "github.com/zitadel/zitadel-go/v2/pkg/client/zitadel"

	"github.com/gin-gonic/gin"
)

const (
	// When asking server to shut down, give it a grace period to finish processing.
	kShutdownTimeout = time.Second * 15
)

func Run(args []string) {
	log.Debug().Msgf("Running chat api with args: %v", args)

	flagSet := flag.NewFlagSet("api", flag.ExitOnError)
	addr := flagSet.String("addr", ":8080", "websocket service address")
	dsn := flagSet.String("postgres-dsn", "", "database connection string")
	instanceConnectionName := flagSet.String("instance-connection-name", "", "cloud sql instance connection name, if any")
	attachmentsBucket := flagSet.String("attachments-bucket", "", "attachments bucket")
	logLevel := flagSet.String("log-level", "info", "log level: debug, info, warn, error, fatal, panic")
	structuredLog := flagSet.Bool("structured-log", true, "use structured log output")

	zitadelIssuer := flagSet.String("zitadel-issuer", "", "zitadel issuer")

	zitadelAuthKeyPath := flagSet.String("zitadel-auth-key-path", "", "zitadel auth key path "+
		"(supply either this or auth-key-data)")
	zitadelAuthKeyData := flagSet.String("zitadel-auth-key-data", "", "zitadel auth key data "+
		"(supply either this or auth-key-path)")
	zitadelAuthProjectID := flagSet.String("zitadel-auth-project-id", "", "zitadel auth project id")
	zitadelAuthOrgID := flagSet.String("zitadel-auth-org-id", "", "zitadel auth org id")
	zitadelAutoApprove := flagSet.Bool("zitadel-auto-approve", false, "zitadel auto approve new users")

	// For the admin api access the app needs a instance level manager service account.
	// Create the service account in the default org (for example)
	// Then give it IAM OWNER role at instance level
	// https://clemia-test-cudifn.zitadel.cloud/ui/console/instance?id=organizations
	// Then make a service account and set credentials here
	zitadelAdminKeyPath := flagSet.String("zitadel-admin-key-path", "", "zitadel admin key path "+
		"(supply either this or zitadel-admin-key-data)")
	zitadelAdminKeyData := flagSet.String("zitadel-admin-key-data", "", "zitadel admin key data "+
		"(supply either this or zitadel-admin-key-path)")
	pubsubNotificationProject := flagSet.String("pubsub-notification-project", "", "")
	pubsubNotificationTopic := flagSet.String("pubsub-notification-topic", "", "")
	appURL := flagSet.String("app-url", "", "app url")

	if err := env.SetFlagsFromEnvironment(flagSet); err != nil {
		log.Fatal().Err(err).Msg("failed to set flags from environment")
	}

	if err := flagSet.Parse(args); err != nil {
		log.Fatal().Err(err).Msg("failed to parse flags")
	}

	infrastructure.SetupLogger(*structuredLog, *logLevel)

	if len(*zitadelAuthKeyData) == 0 && len(*zitadelAuthKeyPath) == 0 {
		log.Fatal().Msg("either auth-key-path or auth-key-data must be provided")
	}

	if len(*zitadelAdminKeyPath) == 0 && len(*zitadelAdminKeyData) == 0 {
		log.Fatal().Msg("either auth-key-path or auth-key-data must be provided")
	}

	if len(*zitadelAuthProjectID) == 0 {
		log.Fatal().Msg("auth-project-id must be provided")
	}

	if len(*zitadelIssuer) == 0 {
		log.Fatal().Msg("zitadel-issuer must be provided")
	}

	if *pubsubNotificationProject == "" {
		log.Fatal().Msg("notification-project-id must be provided")
	}

	if *pubsubNotificationTopic == "" {
		log.Fatal().Msg("notification-topic must be provided")
	}

	connexion, err := infrastructure.ConnectDB(*dsn, *instanceConnectionName)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to connect to db")
	}

	transactionFactory := postgres.NewTransactionFactory(connexion)
	inMemoryEventLog := eventlog.NewInMemoryEventLog()

	fatalCtx, cancel := context.WithCancel(context.Background())
	defer cancel()

	// TODO: make sure this is the right context to provide to the cloud storage client
	csClient, err := infrastructure.NewCloudStorageClient(fatalCtx, []string{*attachmentsBucket})
	if err != nil {
		log.Panic().Err(err).Msg("failed to create cloud storage client")
	}

	attachmentService := domainServices.NewCloudStorageAttachments(csClient, *attachmentsBucket)

	var tokenSource middleware.JWTProfileTokenSource
	if len(*zitadelAuthKeyPath) > 0 {
		tokenSource = middleware.JWTProfileFromPath(*zitadelAdminKeyPath)
	} else {
		tokenSource = middleware.JWTProfileFromFileData([]byte(*zitadelAdminKeyData))
	}

	profileOption := zitadelClient.WithJWTProfileTokenSource(tokenSource)

	issuerURL, err := url.Parse(*zitadelIssuer)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to parse zitadel issuer")
	}

	adminAdminClient, err := zitadelAdmin.NewClient(
		*zitadelIssuer,
		issuerURL.Hostname()+":443",
		[]string{oidc.ScopeOpenID, zitadelClient.ScopeZitadelAPI()},
		profileOption,
	)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to create zitadel admin client")
	}

	managementClient, err := zitadelManagement.NewClient(
		*zitadelIssuer,
		issuerURL.Hostname()+":443",
		[]string{oidc.ScopeOpenID, zitadelClient.ScopeZitadelAPI()},
		profileOption,
	)

	if err != nil {
		log.Fatal().Err(err).Msg("failed to create zitadel management client")
	}
	zitadelService := app.NewZitadelService(
		adminAdminClient,
		managementClient,
		*zitadelAuthProjectID,
		*zitadelAuthOrgID,
		*zitadelAutoApprove,
		"https://"+issuerURL.Hostname(),
	)
	pubsubClient, err := pubsub.NewClient(fatalCtx, *pubsubNotificationProject)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to create pubsub client")
	}
	publisher := notification.NewPublisher(*pubsubNotificationTopic, pubsubClient)

	service := app.NewService(
		transactionFactory,
		inMemoryEventLog, func(err error) {
			log.Error().Err(err).Msg("event output fatal error")
			cancel() // WTF
		},
		attachmentService,
		zitadelService,
		publisher,
		*appURL,
	)

	router := gin.New()
	handlers := apiInternal.NewChatHandlers(transactionFactory, service, inMemoryEventLog)

	if err != nil {
		log.Fatal().Err(err).Msg("failed to create zitadel auth middleware")
	}

	zitadelAuth, err := zitadel.NewIntrospectionInterceptor(*zitadelIssuer, *zitadelAuthKeyPath, *zitadelAuthKeyData)
	if err != nil {
		log.Fatal().Err(err).Msg("failed to create zitadel auth middleware")
	}
	identityMidleware := zitadel.NewIdentityMiddleware(transactionFactory)

	apiInternal.ConfigureRouter(
		router,
		handlers,
		zitadelAuth.Authorize(),
		identityMidleware.Authenticate(*zitadelAuthProjectID),
		infrastructure.NewLogHandler(log.Logger, *structuredLog),
	)

	//handlers := apiInternal.MakeHandlers(repository)
	//r := mux.NewRouter()
	//apiInternal.AddRoutes(r, handlers)
	//
	//loggedRouter := gorillaHandlers.LoggingHandler(os.Stdout, r)

	shutdown := make(chan os.Signal, 1)
	// kill (no param) default send syscanll.SIGTERM
	// kill -2 is syscall.SIGINT
	// kill -9 is syscall. SIGKILL but can"t be catch, so don't need add it
	signal.Notify(shutdown, syscall.SIGINT, syscall.SIGTERM)
	go inMemoryEventLog.Run()
	err = gracefullyListenAndServe(fatalCtx, shutdown, *addr, router)

	if err != nil {
		log.Fatal().Err(err).Msg("failed to listen and serve")
	}
	err = csClient.Close()
	if err != nil {
		log.Error().Err(err).Msg("failed to close cloud storage client")
	}
	err = pubsubClient.Close()
	if err != nil {
		log.Error().Err(err).Msg("failed to close pubsub client")
	}

	os.Exit(0)
}

func gracefullyListenAndServe(
	fatalCtx context.Context,
	shutdown chan os.Signal,
	addr string,
	serverHandler http.Handler) error {
	srv := &http.Server{ //nolint:exhaustruct
		Addr:         addr,
		WriteTimeout: time.Second * 20,
		ReadTimeout:  time.Second * 20,
		IdleTimeout:  time.Second * 60,
		Handler:      serverHandler, // Pass our instance of gorilla/mux in.
	}

	srvErrors := make(chan error, 1)
	go func() {
		log.Printf("Listening on port %s...", addr)
		if err := srv.ListenAndServe(); err != nil && !errors.Is(err, http.ErrServerClosed) {
			srvErrors <- err // Pass the error to main runner to stop it waiting for cancel.
		}
	}()

	// Block until we receive our signal to gracefully shutdown or stop if failed.
	var fatalError error
	select {
	case <-shutdown:
		break
	case <-fatalCtx.Done():
		log.Printf("Shutodown due to fatal ctx signal")
		fatalError = fmt.Errorf("fatal error: %w", fatalCtx.Err())
	case err := <-srvErrors:
		return err
	}

	ctx, cancel := context.WithTimeout(context.Background(), kShutdownTimeout)
	defer cancel()
	log.Info().Msg("Shutting down...")

	shutDownErr := srv.Shutdown(ctx) //nolint:contextcheck
	if errors.Is(shutDownErr, http.ErrServerClosed) {
		return fatalError
	}

	if fatalError != nil {
		return fmt.Errorf("shutdown server: %w", shutDownErr)
	}

	if shutDownErr == nil {
		return nil
	}

	return fmt.Errorf("shutdown server: %w due to %w", shutDownErr, fatalError)
}
