variable "asg_system_name" {
  description = "System Name"
  type = string
}

variable "asg_environment" {
  description = "Environment (e.g. dev, staging, prod)"
  type = string
}

variable "asg_ami_id" {
  description = "AMI ID for the instance"
  type = string
}

variable "asg_instance_type" {
  description = "Instance type for the EC2 instance"
  type = string
}

variable "asg_key_pair_name" {
  description = "Key pair name for the EC2 instance"
  type = string
}

variable "asg_acm" {
  description = "Certificate Manager certificate ARN"
  type = string
}