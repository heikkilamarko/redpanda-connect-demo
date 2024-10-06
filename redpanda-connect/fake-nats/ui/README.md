# UI

## Run UI in development mode

```bash
npm install
npm run dev
```

## Production build

```bash
npm install
npm run build
```

## Serve the production build

```bash
npm run preview
```

## Publish demo jokes to NATS

```bash
nats pub "demo.messages" '{ "joke": { "value": "demo joke" }  }'
```
