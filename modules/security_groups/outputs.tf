output "allow_ssh_bastion_access_id" {
  description = "Bastion host SG ID"
  value       = aws_security_group.allow_ssh_bastion_access.id
}

output "allow_alb_access_id" {
  description = "ALB SG ID"
  value       = aws_security_group.allow_alb_access.id
}

output "allow_fargate_access_id" {
  description = "Backend Fargate SG ID"
  value       = aws_security_group.allow_fargate_access.id
}

output "allow_rds_access_id" {
  description = "RDS SG ID"
  value       = aws_security_group.allow_rds_access.id
}

output "allow_frontend_access_id" {
  description = "Frontend SG ID"
  value       = aws_security_group.allow_frontend_access.id
}