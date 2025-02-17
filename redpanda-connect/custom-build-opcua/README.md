# Redpanda Connect Custom Build - OPC UA

## Build

```bash
go build -o custom-redpanda-connect cmd/redpanda-connect/main.go
```

## Run

```bash
./custom-redpanda-connect run connect.yaml
```

## Docker Build

```bash
docker build -t custom-redpanda-connect .
```

## Docker Run

```bash
docker run --rm -it -v $(pwd):/connect -w /connect custom-redpanda-connect:latest run connect.yaml
```
