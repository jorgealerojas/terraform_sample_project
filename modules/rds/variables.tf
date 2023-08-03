variable "db_subnet_group_name" {
  description = "Database subnet group name"
  type        = string
}

/*variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}*/

variable "db_parameter_group_name" {
  description = "Database parameter group name"
  type        = string
}

variable "database_identifier" {
  description = "The Database identifier displayed in the AWS console"
  type        = string
}

variable "database_size" {
  description = "Database storage size in gigabytes (GB)"
  type        = number
}

variable "database_instance_class" {
  description = "The Amazon RDS database instance class"
  type        = string
  default     = "db.t3.small"
}

variable "database_user" {
  description = "The Amazon RDS master username"
  type        = string
}

variable "database_password" {
  description = "The Amazon RDS master password"
  type        = string
  #sensitive   = true
}

/*variable "postgres_security_group" {
  description = "The Security Group ID to apply to the RDS Instance"
  type        = string
}*/

variable "database_environment" {
  description = "Database Environment"
  type        = string
}
