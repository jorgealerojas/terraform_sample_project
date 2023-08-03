//this is the ECS CLUSTER ID module in ../vpc/ecs_cluster.tf folder
data "terraform_remote_state" "ecs_cluster" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

//this is the ECS ROLE ARN module in ../vpc/ecs_role.tf folder
data "terraform_remote_state" "ecs_role" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

//this is for the BACKEND subnets of the VPC module in ../modules/vpc.tf folder
data "terraform_remote_state" "backend_subnets" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

//this is for the BACKEND SG of the SG module in ../modules/security_groups.tf folder
data "terraform_remote_state" "backend_security_group" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

//this is for the BACKEND ALB of the alb module in ../modules/alb_backend.tf folder
data "terraform_remote_state" "alb_backend" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}


resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.ecs_service_task_system_name}-backend-dev"
  task_role_arn            = data.terraform_remote_state.ecs_role.outputs.ecs_task_execution_role 
  execution_role_arn       = data.terraform_remote_state.ecs_role.outputs.ecs_task_execution_role
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.ecs_service_task_deployment_env == "dev" ? "512" : "1024"
  memory                   = var.ecs_service_task_deployment_env == "dev" ? "1GB" : "2GB"
  container_definitions    = templatefile("./modules/ecs_service_task_definition/container_definitions.tpl", { ecs_service_task_system_name = var.ecs_service_task_system_name, ecs_service_task_ecr = var.ecs_service_task_ecr, ecs_service_task_cloudwatch_logs_group_name = var.ecs_service_task_cloudwatch_logs_group_name, ecs_service_task_region = var.ecs_service_task_region })
}

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.ecs_service_task_system_name}-service-dev"
  cluster         = data.terraform_remote_state.ecs_cluster.outputs.ecs_cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.ecs_service_task_deployment_env == "prod" ? 2 : 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = data.terraform_remote_state.backend_subnets.outputs.vpc_backend_subnets_id
    security_groups  = [data.terraform_remote_state.backend_security_group.outputs.sg_fargate_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = data.terraform_remote_state.alb_backend.outputs.public_alb_arn
    container_name   = "${var.ecs_service_task_system_name}-container-dev"
    container_port   = 3000
  }
}
