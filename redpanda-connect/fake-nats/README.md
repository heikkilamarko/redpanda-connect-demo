# NATS

## Select context

```bash
nats context select
```

## List streams

```bash
nats stream ls
```

## Get messages

```bash
nats con next demo demo --raw | jq
```

## View dead-lettered messages

```bash
nats stream view demo_dlq --translate 'jq'
```
