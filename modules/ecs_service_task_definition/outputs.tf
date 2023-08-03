output "ecs_task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  value       = aws_ecs_task_definition.ecs_task_definition.arn
}

output "ecs_service_name" {
  description = "Name of the ECS Service"
  value       = aws_ecs_service.ecs_service.name
}
