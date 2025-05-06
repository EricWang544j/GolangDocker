FROM golang:1.21-alpine

WORKDIR /app

COPY . .

RUN go build -o app .

EXPOSE 8087

CMD ["./app"]