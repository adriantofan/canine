package api

import (
	apiInternal "back/internal/pkg/api"
	"back/internal/pkg/db/postgres"
	"back/internal/pkg/env"
	"back/internal/pkg/infrastructure"
	"context"
	"errors"
	"flag"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
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
	rdb := infrastructure.NewRedisClient("redis://localhost:6379/0?protocol=3")
	updateNotifier := infrastructure.NewUpdateNotifier(rdb)
	repository := postgres.NewMessageRepository(connexion, updateNotifier)
	router := gin.New()
	handlers := apiInternal.NewChatHandlers(repository, rdb)
	middleware := apiInternal.NewChatMiddleware(repository)
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

	err = gracefullyListenAndServe(shutdown, *addr, router)

	if err != nil && !errors.Is(err, http.ErrServerClosed) {
		log.Fatal(err)
	}

	os.Exit(0)

}

func gracefullyListenAndServe(shutdown chan os.Signal, addr string, serverHandler http.Handler) error {
	srv := &http.Server{
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
	select {
	case <-shutdown:
		break
	case err := <-srvErrors:
		return err
	}

	ctx, cancel := context.WithTimeout(context.Background(), time.Second*15)
	defer cancel()
	log.Println("Shutting down...")
	return srv.Shutdown(ctx)
}
