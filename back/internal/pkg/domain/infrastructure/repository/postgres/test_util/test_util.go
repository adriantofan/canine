package test_util

import (
	"back/internal/pkg/infrastructure"
	"database/sql"
	"errors"
	"fmt"
	"net/url"
	"os"

	"github.com/jackc/pgerrcode"

	"github.com/golang-migrate/migrate/v4"
	migratePGX "github.com/golang-migrate/migrate/v4/database/pgx/v5"
	_ "github.com/golang-migrate/migrate/v4/source/file"

	"github.com/jackc/pgx/v5/pgconn"
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
	// no database name = connects to database named the same as the user
	Expect(dsnURL.Path).To(Equal("/"))
	dsnURL.Path = "canine_it_test"
	var testDB *sql.DB
	if create {
		testDB, err = infrastructure.ConnectDB(dsn, "")
		Expect(err).ToNot(HaveOccurred())
		_, err := testDB.Exec("DROP DATABASE IF EXISTS canine_it_test")
		Expect(err).ToNot(HaveOccurred())
		_, err = testDB.Exec("CREATE DATABASE canine_it_test")
		Expect(err).ToNot(HaveOccurred())
		_ = testDB.Close()

		testDB, err = infrastructure.ConnectDB(dsnURL.String(), "")
		Expect(err).ToNot(HaveOccurred())
		// the following must reflect the setup in the migrations_roles
		_, err = testDB.Exec(`
				ALTER DATABASE canine_it_test
				SET log_statement = 'all';
				GRANT ddl_grp TO "postgres";
				GRANT dml_grp TO "postgres";
				GRANT CONNECT, TEMPORARY
				ON DATABASE canine_it_test TO ddl_grp, dml_grp, read_only_grp;
				GRANT USAGE, CREATE
				ON SCHEMA public TO ddl_grp;
				GRANT ALL
				ON ALL TABLES IN SCHEMA public TO ddl_grp;
				GRANT ALL
				ON ALL SEQUENCES IN SCHEMA public TO ddl_grp;
				GRANT USAGE ON SCHEMA public TO dml_grp, read_only_grp;
				-- modify privileges for any existing tables and sequences
				GRANT SELECT
					ON ALL TABLES IN SCHEMA public TO dml_grp, read_only_grp;
				GRANT USAGE, SELECT
					ON ALL SEQUENCES IN SCHEMA public TO dml_grp, read_only_grp;
				ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
					GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO dml_grp;
				
				ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
					GRANT SELECT ON TABLES TO read_only_grp;
				
				ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
					GRANT USAGE, SELECT ON SEQUENCES TO dml_grp, read_only_grp;
				
				ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
					GRANT UPDATE ON SEQUENCES TO dml_grp;
				SET ROLE ddl_grp;
				CREATE TABLE IF NOT EXISTS public.schema_migrations (version bigint not null primary key, dirty boolean not null);
				RESET ROLE;
			`)
		Expect(err).ToNot(HaveOccurred())
		_ = testDB.Close()
	}

	return dsnURL.String()
}

func MustCreateTestDBWithMigrations() (*sql.DB, *migrate.Migrate) {
	testDB, m := MustOpenTestDBWithMigrate()
	err := m.Up()
	if err != nil && !errors.Is(err, migrate.ErrNoChange) {
		Expect(err).ToNot(HaveOccurred())
	}
	return testDB, m
}

func MustOpenTestDBWithMigrate() (*sql.DB, *migrate.Migrate) {
	dsn := MustMakeTestDB(false)
	testDB, err := infrastructure.ConnectDB(dsn, "")
	if err != nil {
		var pgError *pgconn.PgError
		if errors.As(err, &pgError) {
			if pgError.Code == pgerrcode.InvalidCatalogName {
				// try to create the database
				dsn := MustMakeTestDB(true)
				testDB, err = infrastructure.ConnectDB(dsn, "")
			}
		}
	}
	Expect(err).ToNot(HaveOccurred())

	driver, err := migratePGX.WithInstance(testDB, &migratePGX.Config{})
	Expect(err).ToNot(HaveOccurred())
	m, err := migrate.NewWithDatabaseInstance(
		GetMigrationDir(),
		"canine_it_test", // this is used only for logging
		driver)
	m.Log = &MigrateLogger{}
	Expect(err).ToNot(HaveOccurred())

	return testDB, m
}

type MigrateLogger struct {
}

// Printf is like fmt.Printf
func (l *MigrateLogger) Printf(format string, v ...interface{}) {
	fmt.Printf(format, v...)
}

// Verbose should return true when verbose logging output is wanted
func (l *MigrateLogger) Verbose() bool {
	return true
}

func GetMigrationDir() string {
	migrationDir := os.Getenv("MIGRATION_DIR")
	if migrationDir == "" {
		Fail("MIGRATION_DIR is not set")
	}

	return migrationDir
}
