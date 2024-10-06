# Misc

## Interactive Bloblang Editor

### Docker

```bash
docker run -p 4195:4195 --rm docker.redpanda.com/redpandadata/connect blobl server --no-open --host 0.0.0.0
open http://localhost:4195
```

### Local

```bash
rpk connect blobl server
```
