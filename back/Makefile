ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
export GOBIN := $(ROOT_DIR)/.bin
export GOROOT := /Users/adriantofan/.local/share/mise/installs/go/1.21.6/go
GO := TZ=UTC $(GOROOT)/bin/go

SHELL := /bin/bash

WATCHEXEC := watchexec

GOFUMPT := $(GOBIN)/gofumpt
GOFUMPT_VERSION := v0.5.0 # https://github.com/mvdan/gofumpt/releases

GOIMPORTS := $(GOBIN)/goimports
GOIMPORTS_VERSION := v0.17.0 # https://pkg.go.dev/golang.org/x/tools/cmd/goimports?tab=versions

GOLANGCI_LINT := $(GOBIN)/golangci-lint
GOLANGCI_LINT_VERSION := v1.56.1 # https://github.com/golangci/golangci-lint/releases

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
all: migrate-up generate tidy format lint build test

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

.PHONY: migrate-up
migrate-up: $(MIGRATE)
	$(MIGRATE) \
		-database 'postgres://postgres:postgres@localhost:5432/canine?sslmode=disable' \
		-path ./migrations \
		up

.PHONY: migrate-down
migrate-down: $(MIGRATE)
	$(MIGRATE) \
		-database 'postgres://postgres:postgres@localhost:5432/canine?sslmode=disable' \
		-path ./migrations \
		down --all


.PHONY: migrate-drop
migrate-drop: $(MIGRATE)
	$(MIGRATE) \
		-database 'postgres://postgres:postgres@localhost:5432/canine?sslmode=disable' \
		-path ./migrations \
		drop

.PHONY: generate
generate: generate-models generate-mocks

.PHONY: generate-mocks
generate-mocks: $(MOCKERY)
	@rm -rf ./services/*/mocks
	$(MOCKERY)

.PHONY: generate-models
generate-models: $(JET)
	$(JET) -dsn="postgres://postgres:postgres@localhost:5432/canine?sslmode=disable" -path=./.gen

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
	export POSTGRES_DSN=postgres://postgres:postgres@localhost:5432/?sslmode=disable; \
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
		db rdb

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

.PHONY: migrate-new
migrate-new:
	@if [ -z "$(name)" ]; then \
		echo "Please specify a name for the migration using 'name='" ; \
		exit 1 ; \
	fi
	@if [ -z "$(service)" ]; then \
		echo "Please specify a service using 'service='" ; \
		exit 1 ; \
	fi
	$(MIGRATE) create -ext psql -dir ./services/$(service)/internal/database/migrations $(name)

.PHONY: seed
seed:
	./scripts/delete-qdrant-collection main
	./scripts/create-qdrant-collection main
	$(MAKE) migrate-down migrate-up
	$(GO) run ./scripts/seed
