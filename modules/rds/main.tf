terraform {
  cloud {
    organization = "Shokworks_Inc"
    workspaces{
        name = "terraform_sample_project"
    }
  }
}

//this is for the RDS subnets of the VPC module in ../modules/vpc.tf folder
data "terraform_remote_state" "database_subnets" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

resource "aws_db_subnet_group" "database_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [data.terraform_remote_state.database_subnets.outputs.vpc_database_subnets_id[0],data.terraform_remote_state.database_subnets.outputs.vpc_database_subnets_id[1]]
}

resource "aws_db_parameter_group" "database_parameter_group" {
  name   = var.db_parameter_group_name
  family = "postgres14"

  parameter {
    name  = "max_connections"
    value = "1000"
    apply_method = "pending-reboot"
  }
}

//this is for the RDS SG of the SG module in ../modules/security_groups.tf folder
data "terraform_remote_state" "rds_security_group" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

resource "aws_db_instance" "database" {
  identifier           = "${var.database_identifier}-${var.database_environment}"
  allocated_storage    = var.database_size
  storage_type         = "gp2"
  engine               = "postgres"
  instance_class       = var.database_instance_class
  username             = var.database_user
  password             = var.database_password
  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  skip_final_snapshot  = true

  vpc_security_group_ids = [data.terraform_remote_state.rds_security_group.outputs.sg_rds_id]

  parameter_group_name = aws_db_parameter_group.database_parameter_group.name

  tags = {
    Name = "${var.database_environment}-Postgres-DB"
  }
}
