# AWS variables
# VPC CIDR block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "aws_region" {
  description = "AWS region for reference resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_key_name" {
  description = "AWS key pair name for SSH access to the EC2 reference instance"
  type        = string
  default     = ""
}

variable "aws_ami_id" {
  description = "Optional explicit AMI id for CentOS 6.10. If empty, Terraform will attempt to find one (may fail)."
  type        = string
  default     = ""
}

variable "aws_instance_type" {
  description = "Instance type for the AWS EC2 reference instance"
  type        = string
  default     = "t3.small"
}

# Azure variables
variable "azure_location" {
  description = "Azure region to deploy to"
  type        = string
  default     = "eastus"
}

variable "resource_prefix" {
  description = "Prefix for Azure resource names"
  type        = string
  default     = "fintrade"
}

variable "admin_username" {
  description = "Admin username for Azure VM"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Admin password for Azure VM (use a secure method in real projects)"
  type        = string
  default     = "ChangeMe123!"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "vm_image_publisher" {
  description = "Azure VM image publisher (default Ubuntu LTS)"
  type        = string
  default     = "Canonical"
}

variable "vm_image_offer" {
  description = "Azure VM image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vm_image_sku" {
  description = "Azure VM image sku"
  type        = string
  default     = "22_04-lts"
}

variable "mysql_administrator_login" {
  description = "Azure MySQL admin username"
  type        = string
  default     = "mysqladmin"
}

variable "mysql_administrator_password" {
  description = "Azure MySQL admin password (use secrets manager in production)"
  type        = string
  default     = "MySQLP@ssw0rd!"
}

variable "mysql_version" {
  description = "Azure Database for MySQL version"
  type        = string
  default     = "8.0"
}

# Network CIDRs
variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aws_public_subnet" {
  type    = string
  default = "10.0.1.0/24"
}

variable "aws_private_subnet" {
  type    = string
  default = "10.0.2.0/24"
}

variable "azure_vnet_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "azure_public_subnet_cidr" {
  type    = string
  default = "10.1.1.0/24"
}

variable "azure_private_subnet_cidr" {
  type    = string
  default = "10.1.2.0/24"
}
# Public subnet CIDR
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type for the trading server"
  type        = string
  default     = "t2.micro"
}

# Key pair name for SSH access
variable "key_name" {
  description = "AWS Key Pair name used for SSH access to EC2 instances"
  type        = string
  default     = ""
}
variable "aws_az" {
  description = "AWS Availability Zone to deploy resources"
  type        = string
  default     = "us-east-1a"
}


