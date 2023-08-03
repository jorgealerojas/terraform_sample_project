variable "ecs_cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "ecs_environment_prefix" {
  description = "An environment name that will be added to the Cluster name"
  type        = string
}