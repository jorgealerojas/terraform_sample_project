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

//this is the VPC_PUBLIC_SUBNET_IDS of the VPC module in ../vpc/main.tf folder
data "terraform_remote_state" "vpc_subnet" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

//this is the FRONTEND SG of the VPC module in ../vpc/security_gorups.tf folder
data "terraform_remote_state" "security_group" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

resource "aws_lb" "alb" {
  name               = "${var.alb_system_name}-${var.alb_deployment_env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.security_group.outputs.sg_alb_id]
  subnets            = [data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[0],data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[1],data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[2]]

  tags = {
    Terraform   = "true"
    Environment = var.alb_deployment_env
    SystemName  = var.alb_system_name
  }
}

resource "aws_lb_target_group" "default" {
  name                 = "${var.alb_system_name}-${var.alb_deployment_env}-tg"
  port                 = 3000
  protocol             = "HTTP"
  vpc_id               = data.terraform_remote_state.vpc.outputs.vpc_id
  target_type          = "ip"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/api/docs"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 5
    matcher             = "200,301"
  }

  tags = {
    Terraform   = "true"
    Environment = var.alb_deployment_env
    SystemName  = var.alb_system_name
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.alb_ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}
