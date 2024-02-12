package api

import (
	apiInternal "back/internal/pkg/api"
	"back/internal/pkg/app"
	"back/internal/pkg/domain/infrastructure/repository/postgres"
	"back/internal/pkg/env"
	"back/internal/pkg/rt/eventlog"
	"context"
	"errors"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
)

const (
	// When asking server to shut down, give it a grace period to finish processing.
	kShutdownTimeout = time.Second * 15
)

func Run(args []string) {
	fs := flag.NewFlagSet("api", flag.ExitOnError)
	addr := fs.String("addr", ":8080", "websocket service address")
	dsn := fs.String("dsn", "", "database connection string")

	if err := env.SetFlagsFromEnvironment(fs); err != nil {
		log.Fatal(err)
	}

	if err := fs.Parse(args); err != nil {
		log.Fatal(err)
	}

	connexion, err := sqlx.Connect("postgres", *dsn)
	if err != nil {
		log.Fatalln(fmt.Errorf("failed to connect to postgress: %w", err))
	}

	transactionFactory := postgres.NewTransactionFactory(connexion)
	eventsOutput := eventlog.NewInMemoryEventLog()

	fatalCtx, cancel := context.WithCancel(context.Background())
	defer cancel()
	service := app.NewService(transactionFactory, eventsOutput, func(err error) {
		log.Printf("event output fatal error: %v", err)
		cancel()
	})

	router := gin.New()
	handlers := apiInternal.NewChatHandlers(transactionFactory, service)
	middleware := apiInternal.NewChatMiddleware(transactionFactory)
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

	if fatalError == nil {
		return fmt.Errorf("shutdown server: %w", shutDownErr)
	}

	if shutDownErr == nil {
		return nil
	}

	return fmt.Errorf("shutdown server: %w due to %w", shutDownErr, fatalError)
}
