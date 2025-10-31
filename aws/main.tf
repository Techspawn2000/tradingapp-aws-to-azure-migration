#############################################
# AWS TRADING PLATFORM INFRASTRUCTURE (PHASE 1)
# Migration Source: AWS → Azure
# OS: CentOS 6.10
#############################################

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

#############################################
# OPTIONAL: S3 BUCKET (FOR MIGRATION DATA)
#############################################

resource "aws_s3_bucket" "trading_data" {
  bucket        = "trading-platform-migration-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name = "trading-platform-migration"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

#############################################
# OUTPUTS
#############################################

output "public_ip" {
  description = "Public IP of the Trading Platform instance"
  value       = aws_instance.trading_app.public_ip
}

