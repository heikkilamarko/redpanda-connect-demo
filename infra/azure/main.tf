variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in. Example: West Europe"
  type        = string
}

variable "owner" {
  description = "Owner of the resources, used for tagging"
  type        = string
}

provider "azurerm" {
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = true
    }
  }
  subscription_id = var.azure_subscription_id
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-redpanda-connect-demo"
  location = var.location

  tags = {
    owner = var.owner
  }
}

resource "azurerm_eventhub_namespace" "demo" {
  name                = "sbns-redpanda-connect-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "demo" {
  name              = "redpanda-connect-demo"
  namespace_id      = azurerm_eventhub_namespace.demo.id
  partition_count   = 1
  message_retention = 1
}

output "eventhub_name" {
  value = azurerm_eventhub_namespace.demo.name
}

output "eventhub_connection_string" {
  value     = azurerm_eventhub_namespace.demo.default_primary_connection_string
  sensitive = true
}
