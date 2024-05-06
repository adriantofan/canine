package infrastructure

import (
	"context"
	"database/sql"
	"fmt"
	"net"

	"cloud.google.com/go/cloudsqlconn"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/stdlib"
	"github.com/rs/zerolog/log"
)

func ConnectDB(dsn, instanceConnectionName string) (*sql.DB, error) {
	var db *sql.DB
	var err error
	if instanceConnectionName != "" {
		db, err = ConnectDBCloudSQL(dsn, instanceConnectionName)
	} else {
		db, err = ConnectDBDirect(dsn)
	}
	if err != nil {
		return nil, fmt.Errorf("failed to connect to db: %w", err)
	}

	if pingErr := db.Ping(); pingErr != nil {
		return nil, fmt.Errorf("db.Ping: %w", pingErr)
	}

	return db, err
}

func ConnectDBDirect(dsn string) (*sql.DB, error) {
	dbPool, err := sql.Open("pgx", dsn)
	if err != nil {
		return nil, fmt.Errorf("sql.Open: %w", err)
	}

	return dbPool, nil
}

func ConnectDBCloudSQL(dsn, instanceConnectionName string) (*sql.DB, error) {
	log.Info().Msgf("Connecting to Cloud SQL instance %s dsn %s", instanceConnectionName, dsn)
	dialer, err := cloudsqlconn.NewDialer(context.Background(), cloudsqlconn.WithIAMAuthN())
	if err != nil {
		return nil, fmt.Errorf("cloudsqlconn.NewDialer: %w", err)
	}
	var opts []cloudsqlconn.DialOption
	opts = append(opts, cloudsqlconn.WithPrivateIP())

	config, err := pgx.ParseConfig(dsn)
	if err != nil {
		return nil, fmt.Errorf("pgx.ParseConfig: %w", err)
	}

	config.DialFunc = func(ctx context.Context, network, instance string) (net.Conn, error) {
		db, err := dialer.Dial(ctx, instanceConnectionName, opts...)
		if err != nil {
			return nil, fmt.Errorf("dialer.Dial: %w", err)
		}

		return db, nil
	}
	dbURI := stdlib.RegisterConnConfig(config)
	dbPool, err := sql.Open("pgx", dbURI)
	if err != nil {
		return nil, fmt.Errorf("sql.Open: %w", err)
	}

	return dbPool, nil
}
