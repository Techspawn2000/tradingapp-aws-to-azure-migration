###############################
# Azure target infra for tradingapp
###############################

resource "azurerm_container_registry" "acr" {
  name                = "tradingapp${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "Central US"
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_service_plan" "asp" {
  name                = "${var.web_app_name_prefix}-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "Central US"
  os_type             = "Linux"
  sku_name            = "B1"
  tags = {
    project = "aws-to-azure-migration"
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.resource_prefix}-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = false

  site_config {
    application_stack {
      docker_image_name   = "tradingapp:latest"
      docker_registry_url = "https://${azurerm_container_registry.acr.login_server}"
    }
  }

  app_settings = {
    "WEBSITES_PORT" = "80"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    project = "aws-to-azure-migration"
  }
}




output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "web_app_default_hostname" {
  value = azurerm_linux_web_app.webapp.default_hostname
}
