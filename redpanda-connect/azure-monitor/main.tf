provider "azurerm" {
  features {}
  subscription_id = "__AZURE_SUBSCRIPTION_ID__"
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-rpconnect-demo"
  location = "West Europe"
}

resource "azurerm_user_assigned_identity" "demo" {
  name                = "id-rpconnect-demo"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
}

resource "azurerm_container_registry" "demo" {
  name                = "crrpconnectdemo"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "demo_container_registry" {
  scope                = azurerm_container_registry.demo.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.demo.principal_id
}

resource "azurerm_log_analytics_workspace" "demo" {
  name                = "log-rpconnect-demo"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
}

resource "azurerm_application_insights" "demo" {
  name                = "appi-rpconnect-demo"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  workspace_id        = azurerm_log_analytics_workspace.demo.id
  application_type    = "other"
}

resource "azurerm_container_app_environment" "demo" {
  name                       = "cae-rpconnect-demo"
  resource_group_name        = azurerm_resource_group.demo.name
  location                   = azurerm_resource_group.demo.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.demo.id
}

resource "azurerm_container_app" "demo" {
  name                         = "ca-rpconnect-demo"
  container_app_environment_id = azurerm_container_app_environment.demo.id
  resource_group_name          = azurerm_resource_group.demo.name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.demo.id]
  }

  registry {
    server   = azurerm_container_registry.demo.login_server
    identity = azurerm_user_assigned_identity.demo.id
  }

  template {
    min_replicas = 1
    max_replicas = 1

    container {
      name   = "demo-pipeline"
      image  = "${azurerm_container_registry.demo.login_server}/demo-pipeline:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "HTTP_ADDRESS"
        value = "0.0.0.0:8080"
      }

      env {
        name  = "LOG_LEVEL"
        value = "INFO"
      }

      env {
        name  = "OPEN_TELEMETRY_COLLECTOR_GRPC_ADDRESS"
        value = "localhost:4317"
      }

      readiness_probe {
        transport = "HTTP"
        port      = 8080
        path      = "/ready"
      }

      liveness_probe {
        transport = "HTTP"
        port      = 8080
        path      = "/ping"
      }
    }

    container {
      name   = "demo-otel-collector"
      image  = "${azurerm_container_registry.demo.login_server}/demo-otel-collector:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "APPLICATIONINSIGHTS_CONNECTION_STRING"
        value = azurerm_application_insights.demo.connection_string
      }
    }
  }
}
