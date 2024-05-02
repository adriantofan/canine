FROM golang:1.21 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -o canine-be

FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /app

RUN adduser -D appuser && chown -R appuser:appuser /app
USER appuser

COPY --from=builder /app/canine-be /app/canine-be

CMD ["/app/canine-be"]