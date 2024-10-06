# PostgreSQL

## Connect to the demo database

```bash
psql -h localhost -U postgres -d redpanda_connect
```

## Run SQL commands

```bash
SELECT COUNT(*) FROM demo.processed_messages;
```

```bash
SELECT name, created_at FROM demo.processed_messages ORDER BY created_at DESC LIMIT 10;
```

## Quit

```bash
\q
```
