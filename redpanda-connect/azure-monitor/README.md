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

### Grafana Alloy

```bash
./build.sh demo-alloy latest
```

```bash
./push.sh demo-alloy latest
```

## 4. Set Azure Monitor Workspace Metrics Ingestion Endpoint

In `main.tf` replace `__AZURE_MONITOR_WORKSPACE_METRICS_INGESTION_ENDPOINT__` with the endpoint URL visible in the overview section of your Azure Monitor Workspace.

## 5. Run Terraform

```bash
terraform apply
```
