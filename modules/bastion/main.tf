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

//this is the BASTION HOST SG of the VPC module in ../vpc/security_gorups.tf folder
data "terraform_remote_state" "security_group" {
  backend = "remote"

  config = {
    organization = "Shokworks_Inc"
    workspaces = {
      name = "terraform_sample_project"
    }
  }
}

module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name           = var.bastion_name
  ami            = var.bastion_ami_id
  instance_type  = var.bastion_instance_type
  subnet_id      = data.terraform_remote_state.vpc_subnet.outputs.vpc_public_subnets_id[0]
  key_name       = var.bastion_key_pair
  monitoring     = var.bastion_monitoring
  vpc_security_group_ids = [data.terraform_remote_state.vpc_subnet.outputs.sg_bastion_id]

  tags = {
    Terraform   = "true"
    Environment = "Dev"
  }
}