//go:build integration

package postgres_test

import (
	"back/internal/pkg/domain/infrastructure/repository/postgres/test_util"
	"back/internal/pkg/infrastructure"
	"database/sql"

	"github.com/golang-migrate/migrate/v4"
	migratePGX "github.com/golang-migrate/migrate/v4/database/pgx/v5"

	_ "github.com/golang-migrate/migrate/v4/source/file"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var _ = Describe("Integration Migrations", Ordered, func() {
	var testDB *sql.DB

	It("migrates up and down", func() {

		driver, err := migratePGX.WithInstance(testDB, &migratePGX.Config{})
		Expect(err).ToNot(HaveOccurred())
		m, err := migrate.NewWithDatabaseInstance(
			test_util.GetMigrationDir(),
			"postgres", driver)
		Expect(err).ToNot(HaveOccurred())
		err = m.Up()
		Expect(err).ToNot(HaveOccurred())
		err = m.Down()
		Expect(err).ToNot(HaveOccurred())
	})
	BeforeEach(func() {
		var err error
		dsn := test_util.MustMakeTestDB(true) // wants to start from scratch
		testDB, err = infrastructure.ConnectDB(dsn, "")
		Expect(err).ToNot(HaveOccurred())
	})

	AfterEach(func() {
		if testDB != nil {
			err := testDB.Close()
			Expect(err).ToNot(HaveOccurred())
		}
	})

})
