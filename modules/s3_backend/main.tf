resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.s3_param_bucket_name}-${var.s3_param_environment}"
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_kms_key" "kmsKey" {
  description  = "This key is used to encrypt bucket objects"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_ss_encryption" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kmsKey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_iam_user" "s3_user" {
  name = "${var.s3_param_bucket_name}-${var.s3_param_environment}-user"
}

resource "aws_iam_user_policy" "s3_user_policy" {
  name   = "${var.s3_param_bucket_name}-access-${var.s3_param_environment}"
  user   = aws_iam_user.s3_user.name
  policy = data.aws_iam_policy_document.s3_user_policy_doc.json
}

data "aws_iam_policy_document" "s3_user_policy_doc" {
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.s3_bucket.arn, "${aws_s3_bucket.s3_bucket.arn}/*"]
  }
}

resource "aws_iam_access_key" "s3_user_access_key" {
  user = aws_iam_user.s3_user.name
}
