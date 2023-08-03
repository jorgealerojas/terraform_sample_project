## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.allow_alb_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_fargate_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_frontend_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_rds_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_ssh_bastion_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_allow_alb_access_id"></a> [allow\_alb\_access\_id](#output\_allow\_alb\_access\_id) | ALB SG ID |
| <a name="output_allow_fargate_access_id"></a> [allow\_fargate\_access\_id](#output\_allow\_fargate\_access\_id) | Backend Fargate SG ID |
| <a name="output_allow_frontend_access_id"></a> [allow\_frontend\_access\_id](#output\_allow\_frontend\_access\_id) | Frontend SG ID |
| <a name="output_allow_rds_access_id"></a> [allow\_rds\_access\_id](#output\_allow\_rds\_access\_id) | RDS SG ID |
| <a name="output_allow_ssh_bastion_access_id"></a> [allow\_ssh\_bastion\_access\_id](#output\_allow\_ssh\_bastion\_access\_id) | Bastion host SG ID |
