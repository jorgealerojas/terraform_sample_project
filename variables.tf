variable "vpc-name"{
    type = string
    description = "Name of the VPC"
    default     = ""
}

variable "vpc-cidr" {
    type = string
    description = "CIDR VPC Block"
    default     = ""
}

variable "vpc-azs" {
  type    = list(string)
  description = "VPC AZs"
  default     = []
}

variable "vpc-db-subnets" {
  type    = list(string)
  description = "VPC's DB Subnets"
  default     = []
}

variable "vpc-private_subnets" {
  type    = list(string)
  description = "VPC's Private Subnets"
  default     = []
}

variable "vpc-public_subnets" {
  type    = list(string)
  description = "VPC's Public Subnets"
  default     = []
}

variable "bastion_name" {
  description = "Name for the bastion host"
  type        = string
}

variable "bastion_ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "bastion_key_pair" {
  description = "Name of the key pair for the bastion host"
  type        = string
}

variable "bastion_monitoring" {
  description = "Enable detailed monitoring for the bastion host"
  type        = bool
  default     = false
}

variable "s3_param_bucket_name" {
  description = "Bucket Name"
  type        = string
}

variable "s3_param_environment" {
  description = "Environment (dev, stg, or prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "stg", "prod"], lower(var.s3_param_environment))
    error_message = "The environment must be 'dev', 'stg', or 'prod'."
  }
}

variable "ecs_role_system_name" {
  description = "Identifier for the current system and environment"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "ecs_environment_prefix" {
  description = "An environment name that will be added to the Cluster name"
  type        = string
}

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

variable "asg_system_name" {
  description = "System Name"
  type = string
}

variable "asg_environment" {
  description = "Environment (e.g. dev, staging, prod)"
  type = string
}

variable "asg_ami_id" {
  description = "AMI ID for the instance"
  type = string
}

variable "asg_instance_type" {
  description = "Instance type for the EC2 instance"
  type = string
}

variable "asg_key_pair_name" {
  description = "Key pair name for the EC2 instance"
  type = string
}

variable "asg_acm" {
  description = "Certificate Manager certificate ARN"
  type = string
}

variable "alb_system_name" {
  description = "Name of the system"
  type        = string
}

variable "alb_deployment_env" {
  description = "Deployment environment"
  type        = string
}

variable "alb_ssl_certificate_arn" {
  description = "SSL certificate ARN"
  type        = string
}

variable "ecs_service_task_region" {
  description = "AWS Region for CloudWatch logs"
  type        = string
}

variable "ecs_service_task_system_name" {
  description = "Identifier for the current system and environment"
  type        = string
}

variable "ecs_service_task_ecr" {
  description = "Identifier for the ECR repo"
  type        = string
}

variable "ecs_service_task_deployment_env" {
  description = "The environment to be deployed"
  type        = string
}

variable "ecs_service_task_cloudwatch_logs_group_name" {
  description = "CloudWatch log group name"
  type        = string
}


