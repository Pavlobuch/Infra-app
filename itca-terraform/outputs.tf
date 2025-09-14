# Bastion Public IP
output "bastion_ip" {
  description = "Public IP of the bastion host"
  value       = aws_instance.bastion.public_ip
}

# CI/CD Instance Private IP
output "ci_cd_ip" {
  description = "Private IP of the CI/CD instance"
  value       = aws_instance.ci_cd.private_ip
}

# RDS Endpoint
output "rds_endpoint" {
  description = "RDS endpoint address"
  value       = aws_db_instance.main.endpoint
}

# RDS Database Name
output "database_name" {
  description = "Database name"
  value       = aws_db_instance.main.db_name
}

# RDS Username
output "database_username" {
  description = "Database username"
  value       = var.db_username
}

# RDS Password
output "database_password" {
  description = "Database password"
  value       = var.db_password
  sensitive   = true
}

