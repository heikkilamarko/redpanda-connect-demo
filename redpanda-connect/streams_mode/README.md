# Redpanda Connect Pipeline

```bash
docker run --rm -it -v $(pwd):/connect -w /connect redpandadata/connect:4.52 streams -r shared.yaml connect1.yaml connect2.yaml
```
