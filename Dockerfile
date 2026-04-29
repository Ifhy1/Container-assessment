# STAGE 1: Build the binary
FROM golang:1.25-alpine AS builder
WORKDIR /app
COPY Server/MuchToDo/go.mod Server/MuchToDo/go.sum* ./
RUN go mod download
COPY Server/MuchToDo/ .
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/api/main.go

# STAGE 2: Final Runtime
FROM alpine:latest
RUN apk --no-cache add ca-certificates
RUN adduser -D devopsuser
USER devopsuser
WORKDIR /home/devopsuser

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Copy the .env file from your local machine into the container
COPY Server/MuchToDo/.env .

EXPOSE 8080
CMD ["./main"]