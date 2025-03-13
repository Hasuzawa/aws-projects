resource "aws_s3_bucket" "public_bucket" {
  bucket = "${var.project}-public-bucket"

  force_destroy = false
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.public_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }

  #   routing_rule {
  #     condition {

  #     }
  #     redirect {

  #     }
  #   }
}

resource "aws_s3_bucket_ownership_controls" "public_bucket_ownership" {
  bucket = aws_s3_bucket.public_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_bucket_access_block" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  depends_on = [
    aws_s3_bucket_ownership_controls.public_bucket_ownership,
    aws_s3_bucket_public_access_block.public_bucket_access_block
  ]
  acl = "public-read"
}


# resource aws_s3_object object {
# 	bucket = aws_s3_bucket.bucket.id
# 	key = ""
# }

# resource aws_s3_bucket_acl acl {
# 	bucket = aws_s3_bucket.bucket.id

# }
# resource aws_s3_lifecycle_configuration lifecycle_config {

# }
# resource aws_s3_bucket_logging logging {

# }
# resource aws_s3_bucket_request_payment_configuration payment_config {
# 		bucket = aws_s3_bucket.bucket.id
# 		payer = ""
# }
# resource aws_s3_bucket_metric metric {
# 	bucket = aws_s3_bucket.bucket.id
# 	name = ""
# }
# resource aws_s3_bucket_policy policy {
# 	bucket = aws_s3_bucket.bucket.id
# 	policy = ""
# }
# resource aws_s3_bucket_website_configuration website_config {
# 	bucket = aws_s3_bucket.bucket.id
# }
