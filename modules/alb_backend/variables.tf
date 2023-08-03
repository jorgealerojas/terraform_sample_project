variable "alb_system_name" {
  description = "Name of the system"
  type        = string
}

variable "alb_deployment_env" {
  description = "Deployment environment"
  type        = string
}

variable "alb_ssl_certificate_arn" {
  description = "SSL certificate ARN"
  type        = string
  default     = ""
}
