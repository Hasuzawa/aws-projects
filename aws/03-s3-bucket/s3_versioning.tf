resource "aws_s3_bucket_versioning" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "private_bucket" {
  bucket = aws_s3_bucket.private_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# versioning cannot be deleted nor disabled when there is replication
