
resource "aws_s3_bucket_policy" "s3_public_read" {
  bucket = aws_s3_bucket.public_bucket.id
  policy = data.aws_iam_policy_document.s3_public_bucket_read.json
}

data "aws_iam_policy_document" "s3_public_bucket_read" {
  statement {
    sid    = "S3ObjectPublicRead"
    effect = "Allow"
    principals { // this will be recorded as Principal = "*"
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.public_bucket.bucket}/*"
    ]
  }
}
