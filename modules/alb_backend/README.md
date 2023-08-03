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
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [terraform_remote_state.security_group](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc_subnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_deployment_env"></a> [alb\_deployment\_env](#input\_alb\_deployment\_env) | Deployment environment | `string` | n/a | yes |
| <a name="input_alb_ssl_certificate_arn"></a> [alb\_ssl\_certificate\_arn](#input\_alb\_ssl\_certificate\_arn) | SSL certificate ARN | `string` | `""` | no |
| <a name="input_alb_system_name"></a> [alb\_system\_name](#input\_alb\_system\_name) | Name of the system | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_alb_dns_name"></a> [public\_alb\_dns\_name](#output\_public\_alb\_dns\_name) | The DNS name of the ALB |
| <a name="output_public_alb_full_name"></a> [public\_alb\_full\_name](#output\_public\_alb\_full\_name) | The full name of the ALB |
| <a name="output_public_alb_hostname"></a> [public\_alb\_hostname](#output\_public\_alb\_hostname) | The hostname of the ALB (with protocol) |
