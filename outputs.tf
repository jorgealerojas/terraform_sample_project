output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc_main.vpc_id
}

output "vpc_public_subnets_id" {
  description = "IDs of public subnets"
  value       = module.vpc_main.vpc_public_subnets_id
}

output "vpc_database_subnets_id" {
  description = "IDs of public subnets"
  value       = module.vpc_main.vpc_database_subnets_id
}

output "vpc_frontend_subnets_id" {
  description = "IDs of frontend subnets"
  value       = module.vpc_main.vpc_frontend_subnets_id
}

output "vpc_backend_subnets_id" {
  description = "IDs of backend subnets"
  value       = module.vpc_main.vpc_backend_subnets_id
}

output "sg_bastion_id" {
  description = "Bastion host SG ID"
  value       = module.security_groups.allow_ssh_bastion_access_id
}

output "sg_alb_id" {
  description = "ALB SG ID"
  value       = module.security_groups.allow_alb_access_id
}

output "sg_fargate_id" {
  description = "Backend Fargate SG ID"
  value       = module.security_groups.allow_fargate_access_id
}

output "sg_rds_id" {
  description = "RDS SG ID"
  value       = module.security_groups.allow_rds_access_id
}

output "sg_frontend_id" {
  description = "Frontend SG ID"
  value       = module.security_groups.allow_frontend_access_id
}

output "bastion_instance_id" {
  description = "ID of the new Bastion host"
  value       = module.bastion_host.bastion_id
}

output "s3_bucket_name" {
  value       = module.s3_backend.s3_bucket_name
  description = "Name of the Amazon S3 bucket."
}

output "s3_access_key_id" {
  value       = module.s3_backend.s3_access_key_id
  description = "Access Key ID"
}

output "s3_secret_access_key" {
  value       = module.s3_backend.s3_access_key_id
  #sensitive   = true
  description = "Secret Access Key"
}

output "s3_user" {
  value       = module.s3_backend.s3_user
  description = "IAM User Name"
}

output "ecs_managed_aws_services_role" {
  value       = module.ecs_role.ecs_managed_aws_services_role
  description = "A reference to the Managed service role used as task role"
}

output "ecs_task_execution_role" {
  value       = module.ecs_role.ecs_task_execution_role
  description = "A reference to the task execution role"
}

output "ecs_cluster_name" {
  value       = module.ecs_cluster.ecs_cluster_name
  description = "A reference to the ECS cluster"
}

output "ecs_cluster_id" {
  value       = module.ecs_cluster.ecs_cluster_id
  description = "A reference to the ECS cluster ID"
}

output "db_id" {
  value       = module.rds.db_id
  description = "RDS Database ID"
}

output "db_url" {
  value       = module.rds.db_url
  description = "RDS Database URL"
}

output "db_username" {
  value       = module.rds.db_username
  description = "RDS Database admin account user"
}


output "asg_autoscaling_group" {
  value = module.ec2_asg.asg_autoscaling_group
  description = "ASG Name identifier"
}

output "asg_launch_template" {
  value = module.ec2_asg.asg_launch_template
  description = "ASG Launch Template"
}

output "asg_application_load_balancer" {
  value = module.ec2_asg.asg_application_load_balancer
  description = "ASG ALB"
}

output "asg_target_group" {
  value = module.ec2_asg.asg_target_group
  description = "ASG TG"
}

output "public_alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb_backend.public_alb_arn
}

output "public_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb_backend.public_alb_dns_name
}

output "public_alb_full_name" {
  description = "The full name of the ALB"
  value       = module.alb_backend.public_alb_full_name
}

output "public_alb_hostname" {
  description = "The hostname of the ALB (with protocol)"
  value = module.alb_backend.public_alb_hostname
}

output "ecs_task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  value       = module.ecs_service_task.ecs_task_definition_arn
}

output "ecs_service_name" {
  description = "Name of the ECS Service"
  value       = module.ecs_service_task.ecs_service_name
}