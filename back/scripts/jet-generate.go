package main

import (
	"back/internal/pkg/env"
	"flag"
	"log"
	"os"

	"github.com/go-jet/jet/v2/generator/metadata"
	"github.com/go-jet/jet/v2/generator/postgres"
	"github.com/go-jet/jet/v2/generator/template"
	postgres2 "github.com/go-jet/jet/v2/postgres"
	"github.com/jackc/pgx/v5/pgtype"

	// TODO: It would be nice to make this work with PGX
	_ "github.com/lib/pq"
)

func main() {
	flagSet := flag.NewFlagSet("gen", flag.ExitOnError)
	dsn := flagSet.String("postgres-dsn", "", "database connection string")

	if err := env.SetFlagsFromEnvironment(flagSet); err != nil {
		log.Fatal(err)
	}

	if err := flagSet.Parse(os.Args[1:]); err != nil {
		log.Fatal(err)
	}

	if *dsn == "" {
		log.Fatal("postgres-dsn is required")
	}

	err := postgres.GenerateDSN(
		*dsn,
		"public",
		".gen/canine/public",
		template.Default(postgres2.Dialect).
			UseSchema(func(schemaMetaData metadata.Schema) template.Schema {
				return template.DefaultSchema(schemaMetaData).UsePath("../").
					UseModel(template.DefaultModel().
						UseTable(func(t metadata.Table) template.TableModel {
							return template.DefaultTableModel(t).
								UseField(func(c metadata.Column) template.TableModelField {
									defaultTableModelField := template.DefaultTableModelField(c)

									useArray(&defaultTableModelField, t, c)

									return defaultTableModelField
								})
						}))
			}),
	)
	if err != nil {
		log.Fatal(err)
	}
}

func useArray(f *template.TableModelField, _ metadata.Table, c metadata.Column) {
	if c.DataType.Kind == metadata.ArrayType {
		if c.DataType.Name == "text" {
			f.Type = template.NewType(pgtype.FlatArray[string]{})
		}
	}
}
