## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.s3_user_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.s3_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.s3_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_kms_key.kmsKey](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_bucket_ss_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_iam_policy_document.s3_user_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_s3_param_bucket_name"></a> [s3\_param\_bucket\_name](#input\_s3\_param\_bucket\_name) | Bucket Name | `string` | n/a | yes |
| <a name="input_s3_param_environment"></a> [s3\_param\_environment](#input\_s3\_param\_environment) | Environment (dev, stg, or prod) | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_access_key_id"></a> [s3\_access\_key\_id](#output\_s3\_access\_key\_id) | Access Key ID |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | Name of the Amazon S3 bucket. |
| <a name="output_s3_secret_access_key"></a> [s3\_secret\_access\_key](#output\_s3\_secret\_access\_key) | Secret Access Key |
| <a name="output_s3_user"></a> [s3\_user](#output\_s3\_user) | IAM User Name |
