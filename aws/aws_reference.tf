############################################################
# AWS Reference Configuration for Cloud Migration Project
# Platform: Amazon Web Services (AWS)
# OS: Amazon Linux 2
# Author: Techspawn Global Solutions
############################################################

# ----------------------------------------------------------
# Data Sources
# ----------------------------------------------------------

# Fetch the most recent Amazon Linux 2 AMI available in the selected region
data "aws_ami" "amazon_linux2" {
  most_recent = true

  owners = ["137112412989"] # Amazon official AMI account ID

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# ----------------------------------------------------------
# Networking Resources
# ----------------------------------------------------------

# VPC
resource "aws_vpc" "trading_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "Trading-VPC"
    Project = "AWS-to-Azure-Migration"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.trading_vpc.id

  tags = {
    Name = "Trading-IGW"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.trading_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.aws_az
  map_public_ip_on_launch = true

  tags = {
    Name = "Trading-Public-Subnet"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.trading_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Trading-Public-RouteTable"
  }
}

# Associate Subnet with Route Table
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ----------------------------------------------------------
# Security Group
# ----------------------------------------------------------

resource "aws_security_group" "trading_sg" {
  name        = "TradingApp-SG"
  description = "Allow SSH and Web traffic"
  vpc_id      = aws_vpc.trading_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TradingApp-SG"
  }
}

# ----------------------------------------------------------
# EC2 Instance (Amazon Linux 2)
# ----------------------------------------------------------

resource "aws_instance" "trading_app" {
  ami                         = data.aws_ami.amazon_linux2.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.trading_sg.id]
  key_name                    = "tradingapp-key5"
  associate_public_ip_address = true

  tags = {
    Name        = "TradingApp-Server"
    OS          = "Amazon Linux 2"
    Environment = "Migration"
  }
}

# ----------------------------------------------------------
# Outputs
# ----------------------------------------------------------

output "aws_vpc_id" {
  value = aws_vpc.trading_vpc.id
}

output "aws_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "aws_instance_public_ip" {
  value = aws_instance.trading_app.public_ip
}

output "aws_instance_id" {
  value = aws_instance.trading_app.id
}
