FROM golang:1.19 AS builder

WORKDIR /usr/src/app

COPY hello.go .
RUN go env -w GO111MODULE=off

RUN go build -o hello .


# Segundo stage
FROM scratch AS runner

COPY --from=builder /usr/src/app/hello /bin

CMD hello