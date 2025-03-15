resource "aws_s3_bucket" "private_bucket" {
  bucket = "${var.project}-private-bucket"

  force_destroy = true
}
