


## Migrations

### Create new migration:
```
migrate create -ext sql -dir db/migrations -seq

```
### Migrate up/down:
```
make migrate-up-dev
make migrate-revert-last-dev

make migrate-up-prod
make migrate-revert-last-prod
```

### Fresh db for dev:

```
make dump-db-dev
make start-dependencies # it was stopped by the previous command
make  bootstrap-db-dev
# start the go app
make seed-dev
```

### Bootstrap db for prod:
```shell
# Set password for postgres user
export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=sa-tf-cb-k9-canine-infra@prj-c-k9infra-pipeline-vn7v.iam.gserviceaccount.com
gcloud sql users set-password postgres \
    --instance=canine-sql-1-p-europe-west9-2b17793a \
    --project=prj-p-k9canine-sql-y3aq \
    --prompt-for-password  \
    --impersonate-service-account=$GOOGLE_IMPERSONATE_SERVICE_ACCOUNT
```

### Jet 
```shell
jet -dsn="postgres://postgres:postgres@localhost:5432/canine?sslmode=disable" -path=./.gen
```