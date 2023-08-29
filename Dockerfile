FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o full-cycle-rocks main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/full-cycle-rocks /full-cycle-rocks

CMD ["/full-cycle-rocks"]
