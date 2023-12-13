SHELL := /bin/bash

.PHONY: test-integration, test


test-integration:
	export POSTGRES_DSN=postgres://postgres:postgres@localhost:5432/canine?sslmode=disable; \
	ginkgo --tags integration -r


test:
	ginkgo -r
