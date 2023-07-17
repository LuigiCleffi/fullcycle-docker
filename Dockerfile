FROM golang:1.16-alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN echo "module fullcycle-rocks" > go.mod
RUN go build -o main .

FROM scratch
COPY --from=builder /go/src/app/main /app
CMD ["/app"]
