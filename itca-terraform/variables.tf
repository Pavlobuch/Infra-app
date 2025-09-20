variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"  # or remove default to require it in terraform.tfvars
}


variable "key_name" {
  description = "SSH key for EC2 instances"
  type        = string
}

variable "db_username" {
  description = "RDS username"
  type        = string
}

variable "db_password" {
  description = "RDS password"
  type        = string
  sensitive   = true
}

variable "bastion_name" {
  description = "Name of the Bastion EC2 instance"
  type        = string
  default     = "Bastion"
}

variable "ci_cd_name" {
  description = "Name of the CI/CD EC2 instance"
  type        = string
  default     = "CI-CD-instance"
}
