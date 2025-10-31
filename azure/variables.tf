###############################
# Azure variables for FinTrade
###############################

variable "azure_location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "Central US"
}

variable "resource_group_name" {
  type    = string
  default = "rg-tradingapp-migration"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-tradingapp"
}

variable "web_app_name_prefix" {
  default = "tradingapp-web"
}

variable "sku" {
  description = "App Service Plan SKU"
  type        = string
  default     = "B1"
}

variable "resource_prefix" {
  description = "Prefix used for resource names"
  type        = string
  default     = "rg-tradingapp-migration"
}

variable "admin_username" {
  description = "Local admin username for Linux VM"
  type        = string
  default     = "tradingapp"
}

variable "admin_password" {
  description = "Admin password for VM (use KeyVault or env var in production)"
  type        = string
  default     = "ChangeMe123!"
  sensitive   = true
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "vm_image_publisher" {
  description = "VM image publisher"
  type        = string
  default     = "Canonical"
}

variable "vm_image_offer" {
  description = "VM image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vm_image_sku" {
  description = "VM image sku"
  type        = string
  default     = "22_04-lts"
}

variable "azure_vnet_cidr" {
  description = "VNet CIDR"
  type        = string
  default     = "10.1.0.0/16"
}

variable "azure_public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = string
  default     = "10.1.1.0/24"
}

variable "azure_private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = string
  default     = "10.1.2.0/24"
}

variable "mysql_administrator_login" {
  description = "Admin user for Azure MySQL"
  type        = string
  default     = "mysqladmin"
}

variable "mysql_administrator_password" {
  description = "Admin password for Azure MySQL (use secure method in production)"
  type        = string
  sensitive   = true
  default     = "MySQLP@ssw0rd!"
}

variable "mysql_version" {
  description = "Azure MySQL version"
  type        = string
  default     = "8.0"
}
variable "acr_name" {
  description = "Azure Container Registry name"
  default     = "tradingappacr"
}
