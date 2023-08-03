## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.62.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [terraform_remote_state.alb_backend](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.backend_security_group](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.backend_subnets](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.ecs_cluster](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.ecs_role](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_service_task_cloudwatch_logs_group_name"></a> [ecs\_service\_task\_cloudwatch\_logs\_group\_name](#input\_ecs\_service\_task\_cloudwatch\_logs\_group\_name) | CloudWatch log group name | `string` | n/a | yes |
| <a name="input_ecs_service_task_deployment_env"></a> [ecs\_service\_task\_deployment\_env](#input\_ecs\_service\_task\_deployment\_env) | The environment to be deployed | `string` | n/a | yes |
| <a name="input_ecs_service_task_ecr"></a> [ecs\_service\_task\_ecr](#input\_ecs\_service\_task\_ecr) | Identifier for the ECR repo | `string` | n/a | yes |
| <a name="input_ecs_service_task_region"></a> [ecs\_service\_task\_region](#input\_ecs\_service\_task\_region) | AWS Region for CloudWatch logs | `string` | n/a | yes |
| <a name="input_ecs_service_task_system_name"></a> [ecs\_service\_task\_system\_name](#input\_ecs\_service\_task\_system\_name) | Identifier for the current system and environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name) | Name of the ECS Service |
| <a name="output_ecs_task_definition_arn"></a> [ecs\_task\_definition\_arn](#output\_ecs\_task\_definition\_arn) | ARN of the ECS Task Definition |
