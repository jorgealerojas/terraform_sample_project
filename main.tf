terraform {
  cloud {
    organization = "Shokworks_Inc"
    workspaces{
        name = "terraform_sample_project"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}

module "vpc_main" {
  source = "./modules/vpc"
  
  vpc-name = var.vpc-name
  vpc-cidr = var.vpc-cidr

  vpc-azs              = var.vpc-azs
  vpc-db-subnets       = var.vpc-db-subnets
  vpc-private_subnets  = var.vpc-private_subnets
  vpc-public_subnets   = var.vpc-public_subnets
}

module "security_groups" {
  source = "./modules/security_groups"

  depends_on = [module.vpc_main]
}

module "bastion_host" {
  source = "./modules/bastion"

  bastion_name               = var.bastion_name
  bastion_ami_id             = var.bastion_ami_id
  bastion_instance_type      = var.bastion_instance_type
  bastion_key_pair           = var.bastion_key_pair
  bastion_monitoring         = var.bastion_monitoring

  depends_on = [module.vpc_main, module.security_groups]
}

module "s3_backend" {
  source = "./modules/s3_backend"

  s3_param_bucket_name = var.s3_param_bucket_name
  s3_param_environment = var.s3_param_environment
}

module "ecs_role" {
  source = "./modules/ecs_role"

  ecs_role_system_name = var.ecs_role_system_name
}

module "ecs_cluster" {
  source = "./modules/ecs_cluster"

  ecs_cluster_name = var.ecs_cluster_name
  ecs_environment_prefix = var.ecs_environment_prefix
}

module "rds" {
  source = "./modules/rds"

  db_subnet_group_name = var.db_subnet_group_name
  db_parameter_group_name = var.db_parameter_group_name
  database_identifier = var.database_identifier
  database_size = var.database_size
  database_instance_class = var.database_instance_class
  database_user = var.database_user
  database_password = var.database_password
  database_environment = var.database_environment

  depends_on = [module.vpc_main, module.security_groups]
}

module "ec2_asg" {
  source = "./modules/ec2_asg"

  asg_system_name   = var.asg_system_name
  asg_environment   = var.asg_environment
  asg_ami_id        = var.asg_ami_id
  asg_instance_type = var.asg_instance_type
  asg_key_pair_name = var.asg_key_pair_name
  asg_acm           = var.asg_acm

  depends_on = [module.vpc_main, module.security_groups]
}

module "alb_backend" {
  source = "./modules/alb_backend"

  alb_system_name         = var.alb_system_name
  alb_deployment_env      = var.alb_deployment_env
  alb_ssl_certificate_arn = var.alb_ssl_certificate_arn

  depends_on = [module.vpc_main, module.security_groups]
}

module "ecs_service_task" {
  source = "./modules/ecs_service_task_definition"

  ecs_service_task_region                     = var.ecs_service_task_region
  ecs_service_task_system_name                = var.ecs_service_task_system_name
  ecs_service_task_ecr                        = var.ecs_service_task_ecr
  ecs_service_task_deployment_env             = var.ecs_service_task_deployment_env
  ecs_service_task_cloudwatch_logs_group_name = var.ecs_service_task_cloudwatch_logs_group_name

  depends_on = [module.vpc_main, module.security_groups, module.ecs_cluster, module.ecs_role]
}