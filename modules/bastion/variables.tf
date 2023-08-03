variable "bastion_name" {
  description = "Name for the bastion host"
  type        = string
}

variable "bastion_ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "bastion_key_pair" {
  description = "Name of the key pair for the bastion host"
  type        = string
}

variable "bastion_monitoring" {
  description = "Enable detailed monitoring for the bastion host"
  type        = bool
  default     = false
}

