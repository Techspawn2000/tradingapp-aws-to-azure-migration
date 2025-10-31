# azure_mysql.tf
resource "azurerm_mysql_flexible_server" "mysql" {
  name                = "${var.resource_prefix}-mysql-${random_string.suffix.result}"
  location            = "Central US"
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login    = "mysqladmin"
  administrator_password = "TradingApp123!"
  sku_name               = "B_Standard_B1ms"
  version                = "8.0.21"
  storage {
    size_gb = 32
  }
}

resource "azurerm_mysql_flexible_database" "trades_db" {
  name                = "tradesdb"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  depends_on          = [azurerm_mysql_flexible_server.mysql]
}

