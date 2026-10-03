BIN := coffee

.PHONY: build test lint vet vuln fmt up down

build:
	go build -o $(BIN) ./cmd/coffee

test:
	go test -race ./...

vet:
	go vet ./...

lint:
	golangci-lint run

vuln:
	govulncheck ./...

fmt:
	gofmt -w .

up:
	docker compose up -d minio

down:
	docker compose down
