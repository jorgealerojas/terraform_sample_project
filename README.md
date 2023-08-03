## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb_backend"></a> [alb\_backend](#module\_alb\_backend) | ./modules/alb_backend | n/a |
| <a name="module_bastion_host"></a> [bastion\_host](#module\_bastion\_host) | ./modules/bastion | n/a |
| <a name="module_ec2_asg"></a> [ec2\_asg](#module\_ec2\_asg) | ./modules/ec2_asg | n/a |
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | ./modules/ecs_cluster | n/a |
| <a name="module_ecs_role"></a> [ecs\_role](#module\_ecs\_role) | ./modules/ecs_role | n/a |
| <a name="module_ecs_service_task"></a> [ecs\_service\_task](#module\_ecs\_service\_task) | ./modules/ecs_service_task_definition | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_s3_backend"></a> [s3\_backend](#module\_s3\_backend) | ./modules/s3_backend | n/a |
| <a name="module_security_groups"></a> [security\_groups](#module\_security\_groups) | ./modules/security_groups | n/a |
| <a name="module_vpc_main"></a> [vpc\_main](#module\_vpc\_main) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_deployment_env"></a> [alb\_deployment\_env](#input\_alb\_deployment\_env) | Deployment environment | `string` | n/a | yes |
| <a name="input_alb_ssl_certificate_arn"></a> [alb\_ssl\_certificate\_arn](#input\_alb\_ssl\_certificate\_arn) | SSL certificate ARN | `string` | n/a | yes |
| <a name="input_alb_system_name"></a> [alb\_system\_name](#input\_alb\_system\_name) | Name of the system | `string` | n/a | yes |
| <a name="input_asg_acm"></a> [asg\_acm](#input\_asg\_acm) | Certificate Manager certificate ARN | `string` | n/a | yes |
| <a name="input_asg_ami_id"></a> [asg\_ami\_id](#input\_asg\_ami\_id) | AMI ID for the instance | `string` | n/a | yes |
| <a name="input_asg_environment"></a> [asg\_environment](#input\_asg\_environment) | Environment (e.g. dev, staging, prod) | `string` | n/a | yes |
| <a name="input_asg_instance_type"></a> [asg\_instance\_type](#input\_asg\_instance\_type) | Instance type for the EC2 instance | `string` | n/a | yes |
| <a name="input_asg_key_pair_name"></a> [asg\_key\_pair\_name](#input\_asg\_key\_pair\_name) | Key pair name for the EC2 instance | `string` | n/a | yes |
| <a name="input_asg_system_name"></a> [asg\_system\_name](#input\_asg\_system\_name) | System Name | `string` | n/a | yes |
| <a name="input_bastion_ami_id"></a> [bastion\_ami\_id](#input\_bastion\_ami\_id) | AMI ID for the bastion host | `string` | n/a | yes |
| <a name="input_bastion_instance_type"></a> [bastion\_instance\_type](#input\_bastion\_instance\_type) | Instance type for the bastion host | `string` | `"t2.micro"` | no |
| <a name="input_bastion_key_pair"></a> [bastion\_key\_pair](#input\_bastion\_key\_pair) | Name of the key pair for the bastion host | `string` | n/a | yes |
| <a name="input_bastion_monitoring"></a> [bastion\_monitoring](#input\_bastion\_monitoring) | Enable detailed monitoring for the bastion host | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Name for the bastion host | `string` | n/a | yes |
| <a name="input_database_environment"></a> [database\_environment](#input\_database\_environment) | Database Environment | `string` | n/a | yes |
| <a name="input_database_identifier"></a> [database\_identifier](#input\_database\_identifier) | The Database identifier displayed in the AWS console | `string` | n/a | yes |
| <a name="input_database_instance_class"></a> [database\_instance\_class](#input\_database\_instance\_class) | The Amazon RDS database instance class | `string` | `"db.t3.small"` | no |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | The Amazon RDS master password | `string` | n/a | yes |
| <a name="input_database_size"></a> [database\_size](#input\_database\_size) | Database storage size in gigabytes (GB) | `number` | n/a | yes |
| <a name="input_database_user"></a> [database\_user](#input\_database\_user) | The Amazon RDS master username | `string` | n/a | yes |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Database parameter group name | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Database subnet group name | `string` | n/a | yes |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | ECS Cluster name | `string` | n/a | yes |
| <a name="input_ecs_environment_prefix"></a> [ecs\_environment\_prefix](#input\_ecs\_environment\_prefix) | An environment name that will be added to the Cluster name | `string` | n/a | yes |
| <a name="input_ecs_role_system_name"></a> [ecs\_role\_system\_name](#input\_ecs\_role\_system\_name) | Identifier for the current system and environment | `string` | n/a | yes |
| <a name="input_ecs_service_task_cloudwatch_logs_group_name"></a> [ecs\_service\_task\_cloudwatch\_logs\_group\_name](#input\_ecs\_service\_task\_cloudwatch\_logs\_group\_name) | CloudWatch log group name | `string` | n/a | yes |
| <a name="input_ecs_service_task_deployment_env"></a> [ecs\_service\_task\_deployment\_env](#input\_ecs\_service\_task\_deployment\_env) | The environment to be deployed | `string` | n/a | yes |
| <a name="input_ecs_service_task_ecr"></a> [ecs\_service\_task\_ecr](#input\_ecs\_service\_task\_ecr) | Identifier for the ECR repo | `string` | n/a | yes |
| <a name="input_ecs_service_task_region"></a> [ecs\_service\_task\_region](#input\_ecs\_service\_task\_region) | AWS Region for CloudWatch logs | `string` | n/a | yes |
| <a name="input_ecs_service_task_system_name"></a> [ecs\_service\_task\_system\_name](#input\_ecs\_service\_task\_system\_name) | Identifier for the current system and environment | `string` | n/a | yes |
| <a name="input_s3_param_bucket_name"></a> [s3\_param\_bucket\_name](#input\_s3\_param\_bucket\_name) | Bucket Name | `string` | n/a | yes |
| <a name="input_s3_param_environment"></a> [s3\_param\_environment](#input\_s3\_param\_environment) | Environment (dev, stg, or prod) | `string` | `"dev"` | no |
| <a name="input_vpc-azs"></a> [vpc-azs](#input\_vpc-azs) | VPC AZs | `list(string)` | `[]` | no |
| <a name="input_vpc-cidr"></a> [vpc-cidr](#input\_vpc-cidr) | CIDR VPC Block | `string` | `""` | no |
| <a name="input_vpc-db-subnets"></a> [vpc-db-subnets](#input\_vpc-db-subnets) | VPC's DB Subnets | `list(string)` | `[]` | no |
| <a name="input_vpc-name"></a> [vpc-name](#input\_vpc-name) | Name of the VPC | `string` | `""` | no |
| <a name="input_vpc-private_subnets"></a> [vpc-private\_subnets](#input\_vpc-private\_subnets) | VPC's Private Subnets | `list(string)` | `[]` | no |
| <a name="input_vpc-public_subnets"></a> [vpc-public\_subnets](#input\_vpc-public\_subnets) | VPC's Public Subnets | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_application_load_balancer"></a> [asg\_application\_load\_balancer](#output\_asg\_application\_load\_balancer) | ASG ALB |
| <a name="output_asg_autoscaling_group"></a> [asg\_autoscaling\_group](#output\_asg\_autoscaling\_group) | ASG Name identifier |
| <a name="output_asg_launch_template"></a> [asg\_launch\_template](#output\_asg\_launch\_template) | ASG Launch Template |
| <a name="output_asg_target_group"></a> [asg\_target\_group](#output\_asg\_target\_group) | ASG TG |
| <a name="output_bastion_instance_id"></a> [bastion\_instance\_id](#output\_bastion\_instance\_id) | ID of the new Bastion host |
| <a name="output_db_id"></a> [db\_id](#output\_db\_id) | RDS Database ID |
| <a name="output_db_url"></a> [db\_url](#output\_db\_url) | RDS Database URL |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | RDS Database admin account user |
| <a name="output_ecs_cluster_id"></a> [ecs\_cluster\_id](#output\_ecs\_cluster\_id) | A reference to the ECS cluster ID |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | A reference to the ECS cluster |
| <a name="output_ecs_managed_aws_services_role"></a> [ecs\_managed\_aws\_services\_role](#output\_ecs\_managed\_aws\_services\_role) | A reference to the Managed service role used as task role |
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name) | Name of the ECS Service |
| <a name="output_ecs_task_definition_arn"></a> [ecs\_task\_definition\_arn](#output\_ecs\_task\_definition\_arn) | ARN of the ECS Task Definition |
| <a name="output_ecs_task_execution_role"></a> [ecs\_task\_execution\_role](#output\_ecs\_task\_execution\_role) | A reference to the task execution role |
| <a name="output_public_alb_arn"></a> [public\_alb\_arn](#output\_public\_alb\_arn) | The ARN of the ALB |
| <a name="output_public_alb_dns_name"></a> [public\_alb\_dns\_name](#output\_public\_alb\_dns\_name) | The DNS name of the ALB |
| <a name="output_public_alb_full_name"></a> [public\_alb\_full\_name](#output\_public\_alb\_full\_name) | The full name of the ALB |
| <a name="output_public_alb_hostname"></a> [public\_alb\_hostname](#output\_public\_alb\_hostname) | The hostname of the ALB (with protocol) |
| <a name="output_s3_access_key_id"></a> [s3\_access\_key\_id](#output\_s3\_access\_key\_id) | Access Key ID |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | Name of the Amazon S3 bucket. |
| <a name="output_s3_secret_access_key"></a> [s3\_secret\_access\_key](#output\_s3\_secret\_access\_key) | Secret Access Key |
| <a name="output_s3_user"></a> [s3\_user](#output\_s3\_user) | IAM User Name |
| <a name="output_sg_alb_id"></a> [sg\_alb\_id](#output\_sg\_alb\_id) | ALB SG ID |
| <a name="output_sg_bastion_id"></a> [sg\_bastion\_id](#output\_sg\_bastion\_id) | Bastion host SG ID |
| <a name="output_sg_fargate_id"></a> [sg\_fargate\_id](#output\_sg\_fargate\_id) | Backend Fargate SG ID |
| <a name="output_sg_frontend_id"></a> [sg\_frontend\_id](#output\_sg\_frontend\_id) | Frontend SG ID |
| <a name="output_sg_rds_id"></a> [sg\_rds\_id](#output\_sg\_rds\_id) | RDS SG ID |
| <a name="output_vpc_backend_subnets_id"></a> [vpc\_backend\_subnets\_id](#output\_vpc\_backend\_subnets\_id) | IDs of backend subnets |
| <a name="output_vpc_database_subnets_id"></a> [vpc\_database\_subnets\_id](#output\_vpc\_database\_subnets\_id) | IDs of public subnets |
| <a name="output_vpc_frontend_subnets_id"></a> [vpc\_frontend\_subnets\_id](#output\_vpc\_frontend\_subnets\_id) | IDs of frontend subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |
| <a name="output_vpc_public_subnets_id"></a> [vpc\_public\_subnets\_id](#output\_vpc\_public\_subnets\_id) | IDs of public subnets |
