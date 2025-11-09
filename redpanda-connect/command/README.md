# Redpanda Connect Pipeline

## Docker Build

```bash
docker build -t redpanda-connect-command .
```

## Docker Run

```bash
docker run --rm -it -v $(pwd):/connect -w /connect redpanda-connect-command:latest run connect.yaml
```
