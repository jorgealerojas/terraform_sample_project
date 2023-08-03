## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.61.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.database_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.database_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [terraform_remote_state.database_subnets](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.rds_security_group](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_environment"></a> [database\_environment](#input\_database\_environment) | Database Environment | `string` | n/a | yes |
| <a name="input_database_identifier"></a> [database\_identifier](#input\_database\_identifier) | The Database identifier displayed in the AWS console | `string` | n/a | yes |
| <a name="input_database_instance_class"></a> [database\_instance\_class](#input\_database\_instance\_class) | The Amazon RDS database instance class | `string` | `"db.t3.small"` | no |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | The Amazon RDS master password | `string` | n/a | yes |
| <a name="input_database_size"></a> [database\_size](#input\_database\_size) | Database storage size in gigabytes (GB) | `number` | n/a | yes |
| <a name="input_database_user"></a> [database\_user](#input\_database\_user) | The Amazon RDS master username | `string` | n/a | yes |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Database parameter group name | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Database subnet group name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_id"></a> [db\_id](#output\_db\_id) | RDS Database ID |
| <a name="output_db_url"></a> [db\_url](#output\_db\_url) | RDS Database URL |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | RDS Database admin account user |
