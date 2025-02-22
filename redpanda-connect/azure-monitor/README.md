# Running and Monitoring Redpanda Connect Pipelines in Azure Container Apps

## 1. Run Terraform

```bash
terraform init
```

```bash
terraform apply
```

## 2. Build and Push Docker Images

### Demo Pipeline

```bash
./build.sh demo-pipeline latest
```

```bash
./push.sh demo-pipeline latest
```

### OpenTelemetry Collector

```bash
./build.sh otel-collector latest
```

```bash
./push.sh otel-collector latest
```
