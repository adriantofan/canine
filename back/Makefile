ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
export GOBIN := $(ROOT_DIR)/.bin
export GOROOT := /Users/adriantofan/.local/share/mise/installs/go/1.21.8/go
GO := TZ=UTC $(GOROOT)/bin/go

SHELL := /bin/bash

PGUSER_ENCODED=$(call urlencode,canine-sql-migrate-p-sa@prj-p-k9canine-base-f4s4.iam)

WATCHEXEC := watchexec

GOFUMPT := $(GOBIN)/gofumpt
GOFUMPT_VERSION := v0.5.0 # https://github.com/mvdan/gofumpt/releases

GOIMPORTS := $(GOBIN)/goimports
GOIMPORTS_VERSION := v0.17.0 # https://pkg.go.dev/golang.org/x/tools/cmd/goimports?tab=versions

GOLANGCI_LINT := $(GOBIN)/golangci-lint
GOLANGCI_LINT_VERSION := v1.58.2 # https://github.com/golangci/golangci-lint/releases

GOLINES := $(GOBIN)/golines
GOLINES_VERSION := v0.11.0 # https://github.com/segmentio/golines/releases

GOVULNCHECK := $(GOBIN)/govulncheck
GOVULNCHECK_VERSION := v1.0.1 # https://go.googlesource.com/vuln

MIGRATE := $(GOBIN)/migrate
MIGRATE_VERSION := v4.17.0 # https://github.com/golang-migrate/migrate/releases

JET := $(GOBIN)/jet
JET_VERSION := v2.10.1]

GINKGO := $(GOBIN)/ginkgo
GINKGO_VERSION := v2.15.0 # github.com/onsi/ginkgo/v2/ginkgo

.PHONY: all
all: generate tidy format lint build test

.PHONY: prepare-system
prepare-system:
	brew doctor

.PHONY: install
install: $(GOFUMPT) $(GOLANGCI_LINT) $(GOIMPORTS) $(GOVULNCHECK) $(MIGRATE) $(GOLINES) $(GINKGO) $(JET)

$(GOFUMPT):
	$(GO) install mvdan.cc/gofumpt@$(GOFUMPT_VERSION)

$(GOIMPORTS):
	$(GO) install golang.org/x/tools/cmd/goimports@$(GOIMPORTS_VERSION)

$(GOLANGCI_LINT):
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(GOBIN) v1.55.2

$(GOLINES):
	$(GO) install github.com/segmentio/golines@$(GOLINES_VERSION)

$(GOVULNCHECK):
	$(GO) install golang.org/x/vuln/cmd/govulncheck@$(GOVULNCHECK_VERSION)

$(MIGRATE):
	$(GO) install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@$(MIGRATE_VERSION)

$(JET):
	$(GO) install github.com/go-jet/jet/v2/cmd/jet@$(JET_VERSION)

$(GINKGO):
	$(GO) install github.com/onsi/ginkgo/v2/ginkgo@$(GINKGO_VERSION)

.PHONY: generate
generate: generate-models #generate-mocks


#.PHONY: generate-mocks
#generate-mocks: $(MOCKERY)
#	@rm -rf ./services/*/mocks
#	$(MOCKERY)

.PHONY: generate-models
generate-models:
	$(GO) run scripts/jet-generate.go --postgres-dsn="postgres://prod:prod@localhost:5432/canine?sslmode=disable"


.PHONY: build
build:
	$(GO) build .

.PHONY: update
update:
	$(GO) get -t -u ./...
	$(MAKE) tidy

.PHONY: lint
lint: lint-go

.PHONY: lint-go
lint-go: $(GOLANGCI_LINT)
	$(GOLANGCI_LINT) run ./...

.PHONY: test-integration
test-integration: $(GINKGO)
	@export $(shell sed 's/#.*//;s/^ *//;s/ *$$//;/^$$/d' .test.env) && \
	$(GINKGO) --tags integration -r

.PHONY:  test
test: $(GINKGO)
	$(GINKGO) -r


.PHONY: tdd
tdd:
	$(WATCHEXEC) --restart --clear --shell=none -- $(GO) test -race -trimpath ./...

.PHONY: coverage
coverage: test
	$(GO) tool cover -html=coverage.out

.PHONY: tidy
tidy:
	$(GO) mod tidy

.PHONY: format
format: format-go

.PHONY: format-go
format-go: $(GOLINES) $(GOIMPORTS) $(GOFUMPT)
	$(GOLINES) -m 100 -w .
	$(GOIMPORTS) -local 'back' -w $(shell find . \
		-name '*.go' \
		-not -path '.gen/*' \
	)
	$(GOFUMPT) -l -w .


.PHONY: security
security: $(GOVULNCHECK)
	$(GOVULNCHECK) ./...

.PHONY: start
start:
	docker compose up \
		--abort-on-container-exit \
		--remove-orphans \
		--build

.PHONY: start-dependencies
start-dependencies:
	docker compose up \
		--abort-on-container-exit \
		--remove-orphans \
		db rdb gcs-emulator

.PHONY: start-ci-dependencies-background
start-ci-dependencies-background:
	docker compose up -d \
		db rdb

.PHONY: compose-down
compose-down:
	docker compose down

.PHONY: fclean
fclean: clean
	rm -rf $(GOBIN)
	docker system prune --all --volumes --force

.PHONY: start-backend
start-backend:
	$(GO) run . --local

.PHONY: start-backend-watch
start-backend-watch:
	$(WATCHEXEC) --restart --clear --shell=none -- $(MAKE) start-backend

#######################
# Database management #
#######################
.PHONY: _migrate
_migrate: $(MIGRATE)
	@if [ -z "$(PGUSER)" ]; then \
		echo "Please specify a PGUSER" ; \
		exit 1 ; \
	fi
	@if [ -z "$(PGPASSWORD)" ]; then \
		echo "Please specify a PGPASSWORD" ; \
		exit 1 ; \
	fi
	@if [ -z "$(migrate_cmd)" ]; then \
		echo "Please specify a PGPASSWORD" ; \
		exit 1 ; \
	fi
	$(MIGRATE) \
		-database "postgres://$(PGUSER):$(PGPASSWORD)@$(PGHOST):5432/canine?sslmode=disable" \
		-path ./migrations \
		$(migrate_cmd)

.PHONY: migrate-up-dev
migrate-up-dev:
	$(MAKE) _migrate migrate_cmd=up PGUSER=migrate PGPASSWORD=migrate PGHOST="[::1]"

.PHONY: migrate-up-prod
migrate-up-prod:
	$(MAKE) _migrate migrate_cmd=up PGUSER=$(PGUSER_ENCODED) PGPASSWORD=not_a_password PGHOST=127.0.0.1

.PHONY: migrate-revert-last-dev
migrate-revert-last-dev:
	$(MAKE) _migrate migrate_cmd='down 1' PGUSER=migrate PGPASSWORD=migrate PGHOST="[::1]"

.phony: migrate-revert-last-prod
migrate-revert-last-prod:
	$(MAKE) _migrate migrate_cmd='down 1' PGUSER=$(PGUSER_ENCODED) PGPASSWORD=not_a_password PGHOST=127.0.0.1

.PHONY: create-migrations-table

create-migrations-table:
	./scripts/create_migrations_table.sh

.PHONY: bootstrap-db-dev
bootstrap-db-dev: export PGHOST=::1
# it implies that the db is postgres
bootstrap-db-dev: export PGUSER=postgres
bootstrap-db-dev: export PGPASSWORD=postgres
bootstrap-db-dev:
	./scripts/bootstrap_db.sh dev canine
	$(MAKE) create-migrations-table PGDATABASE=canine
	$(MAKE) _migrate migrate_cmd=up PGUSER=migrate PGPASSWORD=migrate PGHOST="[::1]"

# A temporary user must exist and be set up here, by convention it is called 'admin'
# it can be safely removed after the database is set up
.PHONY: bootstrap-db-prod
bootstrap-db-prod: export PGHOST=127.0.0.1
# it implies that the db is postgres
bootstrap-db-prod: export PGUSER=postgres
bootstrap-db-prod:
	@if [ -z "$(PGPASSWORD)" ]; then \
		echo "Please set PGPASSWORD for $(PGUSER)" ; \
		exit 1 ; \
	fi
	./scripts/bootstrap_db.sh prod canine
	# normally we would like to chant in migrate user but the proxy does not allow it without restart
	# so we use the postgres user while setting role to migrate script by script
	$(MAKE) create-migrations-table PGDATABASE=canine
	$(MAKE) _migrate migrate_cmd=up PGHOST=127.0.0.1


.PHONY: dump-db-dev
dump-db-dev:
	docker compose stop
	docker compose rm --force db
	docker volume rm back_pg-data


.PHONY: seed-dev
seed-dev:
	$(MAKE) _migrate migrate_cmd=down PGUSER=migrate PGPASSWORD=migrate
	$(MAKE) _migrate migrate_cmd=up PGUSER=migrate PGPASSWORD=migrate
	./.venv/bin/python seed.py

urlencode = $(shell python -c "import urllib.parse; print(urllib.parse.quote('$(1)'))")

.PHONY: prod-sql-proxy-migrate
prod-sql-proxy-migrate: export ALL_PROXY=socks5://localhost:1080
prod-sql-proxy-migrate: export HTTPS_PROXY=socks5://localhost:1080
prod-sql-proxy-migrate:
	cloud-sql-proxy \
		--private-ip \
		--auto-iam-authn \
		--impersonate-service-account=canine-sql-migrate-p-sa@prj-p-k9canine-base-f4s4.iam.gserviceaccount.com \
		prj-p-k9canine-sql-y3aq:europe-west9:canine-sql-1-p-europe-west9-2b17793a

.PHONY: prod-sql-proxy-iam
prod-sql-proxy-iam: export ALL_PROXY=socks5://localhost:1080
prod-sql-proxy-iam: export HTTPS_PROXY=socks5://localhost:1080
prod-sql-proxy-iam:
	cloud-sql-proxy \
		--private-ip \
		--auto-iam-authn \
		prj-p-k9canine-sql-y3aq:europe-west9:canine-sql-1-p-europe-west9-2b17793a

.PHONY: prod-sql-sock5-proxy
prod-sql-sock5-proxy:
	gcloud compute ssh "gce-bastion-europe-west9-b-01" \
		--tunnel-through-iap \
		--project "prj-p-k9canine-base-f4s4" \
		--ssh-flag="-4 -D 1080 -N"



##################################
# secrets
##################################


.PHONY: generate-key-RS256
generate-key:
	ssh-keygen -t rsa -b 4096 -m PEM -f jwtRS256.key
	openssl rsa -in jwtRS256.key -pubout -outform PEM -out jwtRS256.key.pub

.PHONY: secret-manager-list
secret-manager-list:
	gcloud secrets --project prj-p-k9env-kms-zyow list

.PHONY: secret-manager-describe
secret-manager-describe:
	@if [ -z $(SECRET_NAME) ]; then \
		echo "SECRET_NAME is not set"; \
		exit 1; \
	fi
	gcloud secrets --project prj-p-k9env-kms-zyow describe $(SECRET_NAME)

.PHONY: secret-manager-version-add
secret-manager-version-add:
	@if [ -z $(SECRET_NAME) ]; then \
		echo "SECRET_NAME is not set"; \
		exit 1; \
	fi
	openssl rand -out /dev/stdout 100 | gcloud secrets --project prj-p-k9env-kms-zyow versions add $(SECRET_NAME) --data-file=-

.PHONY: secret-manager-version-list
secret-manager-version-list:
	@if [ -z $(SECRET_NAME) ]; then \
		echo "SECRET_NAME is not set"; \
		exit 1; \
	fi
	gcloud secrets --project prj-p-k9env-kms-zyow versions list $(SECRET_NAME)
