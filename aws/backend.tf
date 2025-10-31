# backend.tf (optional)
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "tfstate-rg"
#     storage_account_name = "tfstatefintrade" # must be globally unique
#     container_name       = "tfstate"
#     key                  = "fintrade.terraform.tfstate"
#   }
#}
