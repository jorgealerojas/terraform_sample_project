module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc-name
  cidr = var.vpc-cidr

  azs              = var.vpc-azs
  database_subnets = var.vpc-db-subnets
  private_subnets  = var.vpc-private_subnets
  public_subnets   = var.vpc-public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}