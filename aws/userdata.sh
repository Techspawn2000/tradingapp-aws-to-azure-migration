#!/bin/bash
#############################################
# USER DATA SCRIPT
# AWS Trading Platform (CentOS 6.10)
# Purpose: Initialize and configure the server
#############################################

# Update system packages
yum update -y

# Install Apache web server and MySQL client
yum install -y httpd mysql

# Start and enable Apache service
systemctl start httpd
systemctl enable httpd

# Set permissions for the web root
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Create a simple Trading Platform homepage
echo "<html>
<head>
  <title>Trading Platform - AWS (CentOS 6.10)</title>
</head>
<body style='font-family: Arial; background-color:#f4f6f8; text-align:center; padding-top:50px;'>
  <h1 style='color:#0073bb;'>Trading Platform</h1>
  <h2>Running on AWS EC2 - CentOS 6.10</h2>
  <p>This server is part of the migration lab from AWS → Azure Cloud using Terraform.</p>
  <p><strong>Deployed via Terraform & User Data</strong></p>
</body>
</html>" > /var/www/html/index.html

# Restart Apache to load new page
systemctl restart httpd

# Enable firewall (optional, for CentOS 6.10 compatibility)
if command -v service >/dev/null 2>&1; then
  service iptables stop
fi

# Log success message
echo "Trading Platform setup completed successfully on $(date)" >> /var/log/userdata.log
