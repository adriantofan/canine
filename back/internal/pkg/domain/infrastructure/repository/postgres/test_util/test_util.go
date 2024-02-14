package test_util

import (
	"errors"

	"net/url"
	"os"

	"github.com/golang-migrate/migrate/v4"
	migratePostgres "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func MustMakeTestDB(create bool) string {

	dsn := os.Getenv("POSTGRES_DSN")
	if dsn == "" {
		Fail("POSTGRES_DSN is not set")
	}

	dsnURL, err := url.Parse(dsn)
	Expect(dsnURL.Scheme).To(Equal("postgres"))
	Expect(dsnURL).ToNot(BeNil())
	Expect(err).ToNot(HaveOccurred())
	Expect(dsnURL.Path).To(Equal("/"))
	var testDB *sqlx.DB
	if create {
		testDB, err = sqlx.Connect("postgres", dsn)
		Expect(err).ToNot(HaveOccurred())
		testDB.MustExec("DROP DATABASE IF EXISTS canine_it_test")
		testDB.MustExec("CREATE DATABASE canine_it_test")
		_ = testDB.Close()

		testDB, err = sqlx.Connect("postgres", dsn)
		testDB.MustExec("DROP DATABASE IF EXISTS canine_it_test")
		testDB.MustExec("CREATE DATABASE canine_it_test")
		_ = testDB.Close()
	}
	dsnURL.Path = "canine_it_test"
	return dsnURL.String()
}

func MustCreateTestDBWithMigrations(create bool, relMigrationDir string) (*sqlx.DB, *migrate.Migrate) {
	testDb, m := MustOpenTestDBWithMigrate(create, relMigrationDir)
	err := m.Up()
	if err != nil && !errors.Is(err, migrate.ErrNoChange) {
		Expect(err).ToNot(HaveOccurred())
	}
	return testDb, m
}

func MustOpenTestDBWithMigrate(create bool, relMigrationDir string) (*sqlx.DB, *migrate.Migrate) {
	dsn := MustMakeTestDB(create)
	testDb, err := sqlx.Connect("postgres", dsn)
	Expect(err).ToNot(HaveOccurred())
	driver, err := migratePostgres.WithInstance(testDb.DB, &migratePostgres.Config{})
	Expect(err).ToNot(HaveOccurred())
	m, err := migrate.NewWithDatabaseInstance(
		relMigrationDir,
		"postgres", driver)
	Expect(err).ToNot(HaveOccurred())

	return testDb, m
}
