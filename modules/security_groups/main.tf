//this is the VPC ID of the VPC module in ../vpc/main.tf folder
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

resource "aws_security_group" "allow_ssh_bastion_access" {
  name        = "allow_ssh_bastion_access"
  description = "Bastion host ssh access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "Bastion host rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_alb_access" {
  name        = "allow_alb_access"
  description = "ALB backend access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "ALB rule for 443 port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ALB rule for 80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_fargate_access" {
  name        = "allow_fargate_access"
  description = "Fargate backend access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description       = "Fargate rule"
    from_port         = 3000
    to_port           = 3000
    protocol          = "tcp"
    security_groups   = [aws_security_group.allow_alb_access.id]
  }
}

resource "aws_security_group" "allow_rds_access" {
  name        = "allow_rds_access"
  description = "RDS Postgres access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description       = "RDS Postgres rule for bastion host"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    security_groups   = [aws_security_group.allow_ssh_bastion_access.id]
  }

  ingress {
    description       = "RDS Postgres rule for backend and fargate access"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    security_groups   = [aws_security_group.allow_alb_access.id]
  }
}

resource "aws_security_group" "allow_frontend_access" {
  name        = "allow_frontend_access"
  description = "EC2 Frontend access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description       = "Frontend rule for ALB access"
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    security_groups   = [aws_security_group.allow_alb_access.id]
  }

  ingress {
    description       = "Frontend rule for Bastion host access"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    security_groups   = [aws_security_group.allow_ssh_bastion_access.id]
  }
}