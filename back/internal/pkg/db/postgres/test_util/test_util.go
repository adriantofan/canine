package test_util

import (
	"errors"
	"github.com/golang-migrate/migrate/v4"
	migratePostgres "github.com/golang-migrate/migrate/v4/database/postgres"
	"github.com/jmoiron/sqlx"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	"net/url"
	"os"
)

func MustMakeTestDB(create bool) string {
	var dsn string

	dsn = os.Getenv("POSTGRES_DSN")
	if dsn == "" {
		Fail("POSTGRES_DSN is not set")
	}

	dsnURL, err := url.Parse(dsn)
	Expect(dsnURL.Scheme).To(Equal("postgres"))
	Expect(dsnURL).ToNot(BeNil())
	Expect(err).ToNot(HaveOccurred())
	Expect(dsnURL.Path).To(Equal("/"))
	var testDb *sqlx.DB
	if create {
		testDb, err = sqlx.Connect("postgres", dsn)
		Expect(err).ToNot(HaveOccurred())
		testDb.MustExec("DROP DATABASE IF EXISTS canine_it_test")
		testDb.MustExec("CREATE DATABASE canine_it_test")
		_ = testDb.Close()

		testDb, err = sqlx.Connect("postgres", dsn)
		testDb.MustExec("DROP DATABASE IF EXISTS canine_it_test")
		testDb.MustExec("CREATE DATABASE canine_it_test")
		_ = testDb.Close()
	}
	dsnURL.Path = "canine_it_test"
	return dsnURL.String()
}

func MustCreateTestDBWithMigrations(create bool) (*sqlx.DB, *migrate.Migrate) {
	testDb, m := MustOpenTestDBWithMigrate(create)
	err := m.Up()
	if err != nil && !errors.Is(err, migrate.ErrNoChange) {
		Expect(err).ToNot(HaveOccurred())
	}
	return testDb, m
}

func MustOpenTestDBWithMigrate(create bool) (*sqlx.DB, *migrate.Migrate) {
	dsn := MustMakeTestDB(create)
	testDb, err := sqlx.Connect("postgres", dsn)
	Expect(err).ToNot(HaveOccurred())
	driver, err := migratePostgres.WithInstance(testDb.DB, &migratePostgres.Config{})
	Expect(err).ToNot(HaveOccurred())
	m, err := migrate.NewWithDatabaseInstance(
		"file://./../../../../migrations",
		"postgres", driver)
	Expect(err).ToNot(HaveOccurred())
	return testDb, m
}
