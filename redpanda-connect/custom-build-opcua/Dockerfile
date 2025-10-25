FROM golang:1.25 AS build
COPY . .
ENV GOPATH=""
ENV CGO_ENABLED=0
RUN go build -trimpath -a -ldflags="-w -s" ./cmd/redpanda-connect

FROM gcr.io/distroless/static
COPY --from=build /go/redpanda-connect /redpanda-connect
ENTRYPOINT ["/redpanda-connect"]
