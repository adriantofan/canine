


## Migrations

Create:
```
migrate create -ext sql -dir db/migrations -seq
```

Fresh db for dev:

```

#drop db
psql -U postgres -h localhost postgres
# close connections from intelij
DROP DATABASE canine;
CREATE DATABASE canine;

# drop only tables
POSTGRESQL_URL="postgres://postgres:postgres@localhost:5432/canine?sslmode=disable" migrate -database {$POSTGRESQL_URL} -path migrations drop
# run migrations
POSTGRESQL_URL="postgres://postgres:postgres@localhost:5432/canine?sslmode=disable" migrate -database {$POSTGRESQL_URL} -path migrations up
```

### Jet 
```shell
jet -dsn="postgres://postgres:postgres@localhost:5432/canine?sslmode=disable" -path=./.gen
```