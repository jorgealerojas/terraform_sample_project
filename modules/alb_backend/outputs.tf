output "public_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "public_alb_full_name" {
  description = "The full name of the ALB"
  value       = aws_lb.alb.name
}

output "public_alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.alb.arn
}

output "public_alb_hostname" {
  description = "The hostname of the ALB (with protocol)"
  value = var.alb_ssl_certificate_arn != "" ? "https://${aws_lb.alb.dns_name}" : "http://${aws_lb.alb.dns_name}"
}
