# Redpanda Connect Pipeline

[Plugins](https://docs.redpanda.com/redpanda-connect/plugins/about/)

## Docker Build

```bash
docker build -t redpanda-connect-python-plugin .
```

## Docker Run

```bash
docker run --rm -it -v $(pwd)/processed:/app/processed redpanda-connect-python-plugin:latest
```
