# Redpanda Connect Pipeline

[Plugins](https://docs.redpanda.com/redpanda-connect/plugins/about/)

## Docker Build

```bash
docker build -t redpanda-connect-python-plugin .
```

## Docker Run

```bash
docker run --rm -it -v $(pwd):/connect -w /connect redpanda-connect-python-plugin:latest run --rpc-plugins=plugin.yaml connect.yaml
```
