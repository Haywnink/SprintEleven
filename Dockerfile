FROM golang:1.22-alpine

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY . .

RUN go build -o main .

RUN apk add --no-cache sqlite

EXPOSE 8080

CMD ["./main"]
