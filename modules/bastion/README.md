## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_bastion"></a> [ec2\_bastion](#module\_ec2\_bastion) | terraform-aws-modules/ec2-instance/aws | 4.3.0 |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.security_group](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc_subnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_ami_id"></a> [bastion\_ami\_id](#input\_bastion\_ami\_id) | AMI ID for the bastion host | `string` | n/a | yes |
| <a name="input_bastion_instance_type"></a> [bastion\_instance\_type](#input\_bastion\_instance\_type) | Instance type for the bastion host | `string` | `"t2.micro"` | no |
| <a name="input_bastion_key_pair"></a> [bastion\_key\_pair](#input\_bastion\_key\_pair) | Name of the key pair for the bastion host | `string` | n/a | yes |
| <a name="input_bastion_monitoring"></a> [bastion\_monitoring](#input\_bastion\_monitoring) | Enable detailed monitoring for the bastion host | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Name for the bastion host | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_id"></a> [bastion\_id](#output\_bastion\_id) | ID of the new Bastion host |
