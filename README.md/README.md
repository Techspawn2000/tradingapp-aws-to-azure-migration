# FinTrade Migration Lab (Terraform)

## Purpose
Simulate migration of a trading platform from AWS (CentOS 6.10 EC2 reference) to Azure (target infra) using Terraform.

## Pre-requisites
- Terraform >= 1.6.0
- AWS CLI configured with access to your AWS account (if using aws_reference.tf)
- Azure CLI and a logged-in session (`az login`) or environment variables for provider auth
- Edit `terraform.tfvars` with appropriate credentials and values (especially admin passwords and AMI id if needed)

## Quick steps
1. `terraform init`
2. `terraform plan -out=tfplan`
3. `terraform apply tfplan`

> Note: you may want to run AWS reference and Azure target in separate workspaces or separate runs.

## Migration notes
- Use Azure Database Migration Service (not part of this Terraform set) to migrate MySQL data from AWS RDS to Azure Database for MySQL.
- Use `azcopy` or `Azure Data Factory` to copy S3 -> Blob storage.
- Replace `cloud_init.yml` with real app deployment steps (download artifacts, configure Tomcat/Apache, database connection strings).

## Cleanup
`terraform destroy` will remove provisioned resources (make sure you are in the correct workspace and account).
