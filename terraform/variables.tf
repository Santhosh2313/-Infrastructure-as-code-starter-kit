variable "aws_region" {
  description = "AWS region"
  type        = "string"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = "string"
  default     = "iac-starter"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = "string"
  default     = "10.0.0.0/16"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = "string"
  sensitive   = true
}
