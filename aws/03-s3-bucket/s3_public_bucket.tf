resource "aws_s3_bucket" "public_bucket" {
  bucket = "${var.project}-public-bucket"

  force_destroy = true # delete all objects in bucket when deleting bucket
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.public_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "api/product/"
    }

    redirect { # this will redirect all /api/product/ to query product/ instead
      replace_key_prefix_with = "product/"
    }
  }
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

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_config" {
  bucket = aws_s3_bucket.public_bucket.id

  rule {
    id = "change to IA"

    filter {
      and {
        prefix                   = "product/"
        object_size_greater_than = 128 # default size limit
      }
    }

    transition {
      days          = 30 # min day for IA
      storage_class = "STANDARD_IA"
    }

    status = "Enabled"
  }

}

resource "aws_s3_bucket_request_payment_configuration" "payment_config" {
  bucket = aws_s3_bucket.public_bucket.id
  payer  = "BucketOwner" # BucketOwner | Requester
}

# resource aws_s3_bucket_metric metric {
# 	bucket = aws_s3_bucket.bucket.id
# 	name = ""
# }
