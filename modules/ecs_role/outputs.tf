output "ecs_managed_aws_services_role" {
  value       = aws_iam_role.ecs_managed_aws_services_role.arn
  description = "A reference to the Managed service role used as task role"
}

output "ecs_task_execution_role" {
  value       = aws_iam_role.ecs_task_execution_role.arn
  description = "A reference to the task execution role"
}
