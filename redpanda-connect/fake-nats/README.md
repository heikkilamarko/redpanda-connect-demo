# NATS Commands

## Select context

```bash
nats context select local
```

## List streams

```bash
nats stream ls
```

## Get messages

```bash
nats con next demo demo --raw | jq
```

## Get dead-lettered messages

```bash
nats stream view demo_dlq --translate 'jq'
```