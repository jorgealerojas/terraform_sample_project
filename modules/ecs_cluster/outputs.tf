output "ecs_cluster_name" {
  value       = aws_ecs_cluster.ecs_cluster.name
  description = "A reference to the ECS cluster"
}

output "ecs_cluster_id" {
  value       = aws_ecs_cluster.ecs_cluster.id
  description = "A reference to the ECS cluster"
}