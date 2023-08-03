output "s3_bucket_name" {
  value       = aws_s3_bucket.s3_bucket.bucket
  description = "Name of the Amazon S3 bucket."
}

output "s3_access_key_id" {
  value       = aws_iam_access_key.s3_user_access_key.id
  description = "Access Key ID"
}

output "s3_secret_access_key" {
  value       = aws_iam_access_key.s3_user_access_key.secret
  sensitive   = true
  description = "Secret Access Key"
}

output "s3_user" {
  value       = aws_iam_user.s3_user.name
  description = "IAM User Name"
}
