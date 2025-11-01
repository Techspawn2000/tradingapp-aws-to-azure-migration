🧩 TradingApp Multi-Cloud Migration Lab (Terraform)

🏁 Overview

This project demonstrates the migration of a containerized TradingApp from AWS to Microsoft Azure, using Terraform as the Infrastructure-as-Code (IaC) tool.
It simulates a real-world multi-cloud environment where an application initially hosted on AWS is later re-provisioned and deployed in Azure Kubernetes Service (AKS).

☁️ Architecture Summary

Source (AWS)

Environment: AWS Cloud

OS: Amazon Linux

Services:

EC2 instance for initial app host

Amazon ECR for container image storage

S3 bucket for static assets (optional)

VPC, Subnets, Security Groups configured via Terraform

Target (Azure)

Environment: Microsoft Azure (Central US region)

Services:

Azure Kubernetes Service (AKS) for container orchestration

Azure Container Registry (ACR) for image management

Azure Load Balancer for external access

Azure Resource Group, Virtual Network, and Node Pools

🛠️ Tools & Technologies

Category	Tools

Infrastructure as Code	Terraform

Cloud Platforms	AWS, Azure

Containerization	Docker, Kubernetes (AKS)

CI/CD & Automation	GitHub / VS Code

Scripting	Bash, YAML

OS Base	Amazon Linux (replacing CentOS 6.10)

⚙️ Pre-requisites

Terraform ≥ 1.6.0

AWS CLI configured (aws configure)

Azure CLI authenticated (az login)

Docker installed locally

kubectl configured for your AKS cluster

Update variables in terraform.tfvars before running

🚀 Deployment Steps

1️⃣ AWS Environment (Source)

Clone this repository

Navigate to the AWS folder:

cd tradingapp-aws


Initialize and deploy:

terraform init

terraform plan -out=tfplan

terraform apply tfplan

2️⃣ Build and Push Docker Image

docker build -t tradingapp:v1 .

docker tag tradingapp:v1 <aws_account_id>.dkr.ecr.<region>.amazonaws.com/tradingapp:v1

docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/tradingapp:v1

3️⃣ Azure Environment (Target)

Move into the Azure folder:

cd ../tradingapp-azure


Initialize and deploy Terraform:

terraform init

terraform plan -out=tfplan

terraform apply tfplan


Attach ACR to AKS:

az aks update -n tradingapp-aks -g tradingapp-rg --attach-acr tradingappregistry123


Deploy TradingApp to AKS:

kubectl apply -f tradingapp-deployment.yaml

kubectl apply -f tradingapp-service.yaml


Verify Pods and Service:

kubectl get pods

kubectl get svc


Access the application via the EXTERNAL-IP displayed from the service output.

🧭 Migration Notes

Application successfully migrated from AWS EC2/ECR → Azure AKS/ACR

Azure Region changed from East US → Central US

OS Base updated from CentOS 6.10 → Amazon Linux

Docker image (tradingapp:v1) stored in Azure Container Registry

Frontend accessed using Azure LoadBalancer IP

🧹 Cleanup

To destroy all provisioned resources:

terraform destroy

💼 Author

Daniel Omokha

Founder, Techspawn Global Solutions

Beginner IT Training: Cisco CCNA | AWS Cloud Practitioner

📞 WhatsApp: +2349027478788

⭐ Acknowledgment

Special thanks to the Techspawn Global Solutions Lab Environment for powering this migration study.

✅ Result

TradingApp successfully migrated and running on Azure Kubernetes Service (AKS), accessible via browser through Azure Load Balancer.

SCREENSHOTS




