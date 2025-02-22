# Running and Monitoring Redpanda Connect Pipelines in Azure Container Apps

## 1. Set Azure Subscription ID

In `main.tf` replace `__AZURE_SUBSCRIPTION_ID__` with your Azure Subscription ID.

## 2. Run Terraform

```bash
terraform init
```

```bash
terraform apply
```

## 3. Build and Push Docker Images

### Demo Pipeline

```bash
./build.sh demo-pipeline latest
```

```bash
./push.sh demo-pipeline latest
```

### OpenTelemetry Collector

```bash
./build.sh demo-otel-collector latest
```

```bash
./push.sh demo-otel-collector latest
```
