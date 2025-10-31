# azure_network.tf
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_prefix}-rg"
  location = "Central US"
  tags = {
    project = "rg-tradingapp-migrationLab"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_prefix}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "Central US"
  address_space       = [var.azure_vnet_cidr]
  tags                = { Env = "target" }
}

resource "azurerm_subnet" "public" {
  name                 = "${var.resource_prefix}-public-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.azure_public_subnet_cidr]
}

resource "azurerm_subnet" "private" {
  name                 = "${var.resource_prefix}-private-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.azure_private_subnet_cidr]
}
