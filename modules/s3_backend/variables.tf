variable "s3_param_bucket_name" {
  description = "Bucket Name"
  type        = string
}

variable "s3_param_environment" {
  description = "Environment (dev, stg, or prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "stg", "prod"], lower(var.s3_param_environment))
    error_message = "The environment must be 'dev', 'stg', or 'prod'."
  }
}
