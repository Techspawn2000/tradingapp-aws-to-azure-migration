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


## 📸 Screenshots

Below are screenshots captured during the Lab Implementation of the **TradingApp AWS to Azure Migration Project**.

Cloud Architectural Diagram :



AWS Infrastructure Provisioning :

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225229.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225251.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225440.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225503.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225543.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225604.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225827.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225933.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20225955.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20230019.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-25%20230039.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-26%20161457.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-26%20200146.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-26%20201113.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-26%20201220.png?raw=true


Azure Infrastructure Setup :

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20121420.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20121447.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20121512.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20171053.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20171146.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20171230.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20171254.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114137.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114203.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114320.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114352.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114423.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114500.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114532.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114612.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114636.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114732.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20114802.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20115150.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20115308.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20115432.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20115734.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20115949.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20120148.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20120209.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-29%20121137.png?raw=true






Application Deployment :

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20054140.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-28%20054232.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-30%20112420.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-30%20112811.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-31%20120804.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-31%20121300.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-31%20123951.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-31%20125819.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-31%20125843.png?raw=true

https://github.com/Techspawn2000/tradingapp-aws-to-azure-migration/blob/main/screenshots/Screenshot%202025-10-31%20125937.png?raw=true




Successful Terraform Apply :


Resource Verification in Azure Portal :






