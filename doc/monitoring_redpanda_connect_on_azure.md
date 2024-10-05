# Monitoring Redpanda Connect on Azure

## Configuration

1. Create a [user-assigned managed identity](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp).

2. Create an [Azure Monitor workspace](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/azure-monitor-workspace-overview).

3. In the Azure Monitor workspace's data collection rule, assign the `Monitoring Metrics Publisher` role to the managed identity.

4. Configure the [Prometheus Remote Write](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#remote_write).

```yaml
# prometheus.yml

# ...

remote_write:
  - url: https://MY_AZURE_MONITOR_WORKSPACE.westeurope-1.metrics.ingest.monitor.azure.com/dataCollectionRules/RULE_ID/streams/Microsoft-PrometheusMetrics/api/v1/write?api-version=2023-04-24
    azuread:
      cloud: "AzurePublic"
      managed_identity:
      client_id: MY_USER_MANAGED_IDENTITY_CLIENT_ID
```

5. Run [Prometheus](https://prometheus.io/) on [Azure Container Apps](https://azure.microsoft.com/en-us/products/container-apps).

## Links

[Remote-write using user-assigned managed identity authentication](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/prometheus-remote-write-virtual-machines?tabs=managed-identity%2Cprom-vm#remote-write-using-user-assigned-managed-identity-authentication)
