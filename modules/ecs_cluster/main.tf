resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_cluster_name}-${var.ecs_environment_prefix}"
}

