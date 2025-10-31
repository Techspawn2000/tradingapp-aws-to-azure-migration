# azure_storage.tf
resource "azurerm_storage_account" "sa" {
  name                     = lower("${var.resource_prefix}st${random_integer.sa_suffix.result}")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "Central US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_integer" "sa_suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_storage_container" "app_logs" {
  name                  = "applogs"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"

  depends_on = [time_sleep.wait_for_storage]
}

resource "time_sleep" "wait_for_storage" {
  depends_on      = [azurerm_storage_account.sa]
  create_duration = "60s"
}


