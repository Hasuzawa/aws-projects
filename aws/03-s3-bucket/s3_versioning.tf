resource "aws_s3_bucket_versioning" "versionings" {
  for_each = toset([
    aws_s3_bucket.public_bucket.id,
    aws_s3_bucket.private_bucket.id
  ])
  bucket = each.value
  versioning_configuration {
    status = "Enabled"
  }
}
