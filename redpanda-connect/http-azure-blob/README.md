# PostgreSQL

## Connect to the demo database

```bash
psql -h localhost -U postgres -d redpanda_connect
```

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
