# PostgreSQL

## Connect to the demo database

```bash
psql -h localhost -U admin -d redpanda_connect
```

| Username | Password   |
| -------- | ---------- |
| `admin`  | `S3c_r3t!` |

## Run SQL commands

```bash
SELECT * FROM demo.factories;
```

```bash
SELECT jsonb_pretty(demo.get_factory_model()) AS factory_model;
```

## Quit

```bash
\q
```
