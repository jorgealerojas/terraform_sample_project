## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc-azs"></a> [vpc-azs](#input\_vpc-azs) | VPC AZs | `list(string)` | `[]` | no |
| <a name="input_vpc-cidr"></a> [vpc-cidr](#input\_vpc-cidr) | CIDR VPC Block | `string` | `""` | no |
| <a name="input_vpc-db-subnets"></a> [vpc-db-subnets](#input\_vpc-db-subnets) | VPC's DB Subnets | `list(string)` | `[]` | no |
| <a name="input_vpc-name"></a> [vpc-name](#input\_vpc-name) | Name of the VPC | `string` | `""` | no |
| <a name="input_vpc-private_subnets"></a> [vpc-private\_subnets](#input\_vpc-private\_subnets) | VPC's Private Subnets | `list(string)` | `[]` | no |
| <a name="input_vpc-public_subnets"></a> [vpc-public\_subnets](#input\_vpc-public\_subnets) | VPC's Public Subnets | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
| <a name="output_vpc_public_subnets_id"></a> [vpc\_public\_subnets\_id](#output\_vpc\_public\_subnets\_id) | IDs of public subnets |
