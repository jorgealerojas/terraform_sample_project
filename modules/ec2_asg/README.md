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
| [aws_autoscaling_attachment.asg_alb_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.ec2_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ec2_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ec2_instance_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_launch_template.lt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.alb_listener_no_ssl_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [terraform_remote_state.security_group](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc_subnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_acm"></a> [asg\_acm](#input\_asg\_acm) | Certificate Manager certificate ARN | `string` | n/a | yes |
| <a name="input_asg_ami_id"></a> [asg\_ami\_id](#input\_asg\_ami\_id) | AMI ID for the instance | `string` | n/a | yes |
| <a name="input_asg_environment"></a> [asg\_environment](#input\_asg\_environment) | Environment (e.g. dev, staging, prod) | `string` | n/a | yes |
| <a name="input_asg_instance_type"></a> [asg\_instance\_type](#input\_asg\_instance\_type) | Instance type for the EC2 instance | `string` | n/a | yes |
| <a name="input_asg_key_pair_name"></a> [asg\_key\_pair\_name](#input\_asg\_key\_pair\_name) | Key pair name for the EC2 instance | `string` | n/a | yes |
| <a name="input_asg_system_name"></a> [asg\_system\_name](#input\_asg\_system\_name) | System Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_application_load_balancer"></a> [asg\_application\_load\_balancer](#output\_asg\_application\_load\_balancer) | n/a |
| <a name="output_asg_autoscaling_group"></a> [asg\_autoscaling\_group](#output\_asg\_autoscaling\_group) | n/a |
| <a name="output_asg_launch_template"></a> [asg\_launch\_template](#output\_asg\_launch\_template) | n/a |
| <a name="output_asg_target_group"></a> [asg\_target\_group](#output\_asg\_target\_group) | n/a |
