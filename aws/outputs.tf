#############################################
# OUTPUTS - AWS TRADING PLATFORM (PHASE 1)
# Displays key AWS resources after deployment
#############################################

# Public IP address of the EC2 instance
output "instance_public_ip" {
  description = "Public IP of the Trading Platform EC2 instance"
  value       = aws_instance.trading_app.public_ip
}

# Private IP of the EC2 instance (useful for internal communication)
output "instance_private_ip" {
  description = "Private IP address of the Trading Platform EC2 instance"
  value       = aws_instance.trading_app.private_ip
}

# VPC ID where the instance and resources are created
output "vpc_id" {
  description = "ID of the AWS VPC for Trading Platform"
  value       = aws_vpc.trading_vpc.id
}

# Subnet ID for networking reference
output "subnet_id" {
  description = "Subnet ID for the Trading Platform EC2 instance"
  value       = aws_subnet.public_subnet.id
}

# Security Group ID applied to the EC2 instance
output "security_group_id" {
  description = "Security Group ID associated with the EC2 instance"
  value       = aws_security_group.trading_sg.id
}

# S3 Bucket for migration data
output "s3_bucket_name" {
  description = "S3 bucket name for storing exported Trading Platform data (for migration to Azure)"
  value       = aws_s3_bucket.trading_data.bucket
}

# SSH connection string for easy access
output "ssh_connection" {
  description = "SSH command to connect to the EC2 instance"
  value       = "ssh -i ${var.key_name}.pem ec2-user@${aws_instance.trading_app.public_ip}"
}

# Web URL for verification
output "web_url" {
  description = "URL to access the Trading Platform web service"
  value       = "http://${aws_instance.trading_app.public_ip}"
}
