variable "vpc-name"{
    type = string
    description = "Name of the VPC"
    default     = ""
}

variable "vpc-cidr" {
    type = string
    description = "CIDR VPC Block"
    default     = ""
}

variable "vpc-azs" {
  type    = list(string)
  description = "VPC AZs"
  default     = []
}

variable "vpc-db-subnets" {
  type    = list(string)
  description = "VPC's DB Subnets"
  default     = []
}

variable "vpc-private_subnets" {
  type    = list(string)
  description = "VPC's Private Subnets"
  default     = []
}

variable "vpc-public_subnets" {
  type    = list(string)
  description = "VPC's Public Subnets"
  default     = []
}