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

resource "aws_launch_template" "lt" {
  name_prefix   = "${var.asg_system_name}-${var.asg_environment}-lt"
  description   = "Launch template for instances"
  image_id      = var.asg_ami_id
  instance_type = var.asg_instance_type
  key_name      = var.asg_key_pair_name

  vpc_security_group_ids = [data.terraform_remote_state.security_group.outputs.sg_frontend_id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                = "${var.asg_system_name}-${var.asg_environment}-asg"
  max_size            = 1
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = [data.terraform_remote_state.vpc_subnet.outputs.vpc_frontend_subnets_id[0], data.terraform_remote_state.vpc_subnet.outputs.vpc_frontend_subnets_id[1], data.terraform_remote_state.vpc_subnet.outputs.vpc_frontend_subnets_id[2]]

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.asg_system_name}-${var.asg_environment}-asg"
    propagate_at_launch = true
  }
}

resource "aws_lb" "alb" {
  name               = "${var.asg_system_name}-${var.asg_environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.security_group.outputs.sg_alb_id]
  subnets            = [data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[0],data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[1],data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[2]]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "${var.asg_system_name}-${var.asg_environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_lb_listener" "alb_listener_no_ssl_certificate" {
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

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.asg_acm

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}


resource "aws_autoscaling_attachment" "asg_alb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  alb_target_group_arn   = aws_lb_target_group.alb_tg.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.asg_system_name}-${var.asg_environment}-instance-profile"
  role = aws_iam_role.ec2_instance_role.name
}

resource "aws_iam_role" "ec2_instance_role" {
  name = "${var.asg_system_name}-${var.asg_environment}-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "ec2_instance_policy" {
  name = "${var.asg_system_name}-${var.asg_environment}-instance-policy"
  role = aws_iam_role.ec2_instance_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "s3:GetObject",
          "s3:ListBucket",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

