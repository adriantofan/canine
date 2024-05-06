package api

import (
	apiInternal "back/internal/pkg/api"
	"back/internal/pkg/app"
	"back/internal/pkg/auth"
	"back/internal/pkg/domain/infrastructure/repository/postgres"
	domainServices "back/internal/pkg/domain/infrastructure/service"
	"back/internal/pkg/env"
	"back/internal/pkg/infrastructure"
	"back/internal/pkg/rt/eventlog"
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	flag "github.com/spf13/pflag"

	"github.com/gin-gonic/gin"
)

const (
	// When asking server to shut down, give it a grace period to finish processing.
	kShutdownTimeout = time.Second * 15
)

func Run(args []string) {
	fs := flag.NewFlagSet("api", flag.ExitOnError)
	addr := fs.String("addr", ":8080", "websocket service address")
	dsn := fs.String("postgres-dsn", "", "database connection string")
	instanceConnectionName := fs.String("instance-connection-name", "", "cloud sql instance connection name, if any")
	authSecret := fs.BytesBase64P("auth-secret", "", nil, "jwt auth secret base64 encoded")
	authRealm := fs.String("auth-realm", "", "auth realm")
	attachmentsBucket := fs.String("attachments-bucket", "", "attachments bucket")

	if err := env.SetFlagsFromEnvironment(fs); err != nil {
		log.Fatal(err)
	}

	if err := fs.Parse(args); err != nil {
		log.Fatal(err)
	}

	connexion, err := infrastructure.ConnectDB(*dsn, *instanceConnectionName)
	if err != nil {
		log.Fatalf("failed to connect to db: %v", err)
	}

	transactionFactory := postgres.NewTransactionFactory(connexion)
	inMemoryEventLog := eventlog.NewInMemoryEventLog()

	fatalCtx, cancel := context.WithCancel(context.Background())
	defer cancel()

	// TODO: make sure this is the right context to provide to the cloud storage client
	csClient, err := infrastructure.NewCloudStorageClient(fatalCtx, []string{*attachmentsBucket})
	if err != nil {
		log.Panicf("failed to create cloud storage client: %v", err)
	}

	attachmentService := domainServices.NewCloudStorageAttachments(csClient, *attachmentsBucket)

	service := app.NewService(transactionFactory, inMemoryEventLog, func(err error) {
		log.Printf("event output fatal error: %v", err)
		cancel() // WTF
	}, attachmentService)

	router := gin.New()
	handlers := apiInternal.NewChatHandlers(transactionFactory, service, inMemoryEventLog)
	middleware, err := auth.Middleware(transactionFactory, *authRealm, *authSecret)
	if err != nil {
		log.Printf("failed to create middleware: %v", err)

	}
	apiInternal.ConfigureRouter(router, handlers, middleware)
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
		log.Fatal(err)
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
	log.Println("Shutting down...")

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
