# outputs.tf

output "mysql_server_name" {
  description = "MySQL flexible server name"
  value       = azurerm_mysql_flexible_server.mysql.name
}

# Azure outputs
output "azure_vm_public_ip" {
  description = "Public IP address for Azure VM"
  value       = azurerm_public_ip.web_pip.ip_address
}

output "azure_mysql_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "azure_storage_account" {
  description = "Azure storage account name"
  value       = azurerm_storage_account.sa.name
}
