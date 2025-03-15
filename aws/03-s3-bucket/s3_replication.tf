locals {
  src  = aws_s3_bucket.public_bucket
  dest = aws_s3_bucket.private_bucket
}

resource "aws_s3_bucket_replication_configuration" "public_to_private" {
  bucket = local.src.id # source bucket

  depends_on = [aws_s3_bucket_versioning.public_bucket]

  role = aws_iam_role.replication.arn

  rule {
    id       = "from-${local.src.bucket}-to-${local.dest.bucket}" # replication rule name
    priority = 0                                                  # default
    status   = "Enabled"

    destination {
      bucket = local.dest.arn # destination bucket
    }
  }
}

# notice we use id for src and arn for dest
