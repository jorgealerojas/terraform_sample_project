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
