terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # OPTIONAL: remote backend examples are below in backend.tf (commented by default)
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}
