output "asg_autoscaling_group" {
  value = aws_autoscaling_group.asg
}

output "asg_launch_template" {
  value = aws_launch_template.lt
}

output "asg_application_load_balancer" {
  value = aws_lb.alb
}

output "asg_target_group" {
  value = aws_lb_target_group.alb_tg
}
