//go:build integration

package postgres_test

import (
	"back/internal/pkg/domain/infrastructure/repository/postgres/test_util"

	"github.com/golang-migrate/migrate/v4"
	migratePostgres "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var _ = Describe("Integration Migrations", Ordered, func() {

	It("migrates up and down", func() {
		dsn := test_util.MustMakeTestDB(true) // wants to start from scratch
		testDb, err := sqlx.Connect("postgres", dsn)
		Expect(err).ToNot(HaveOccurred())
		driver, err := migratePostgres.WithInstance(testDb.DB, &migratePostgres.Config{})
		Expect(err).ToNot(HaveOccurred())
		m, err := migrate.NewWithDatabaseInstance(
			"file://./../../../../migrations",
			"postgres", driver)
		Expect(err).ToNot(HaveOccurred())
		err = m.Up()
		Expect(err).ToNot(HaveOccurred())
		err = m.Down()
		Expect(err).ToNot(HaveOccurred())
	})

})
