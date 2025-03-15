resource "aws_s3_bucket" "input" {
  bucket = "${var.project_name}-input-bucket"

  force_destroy = true
}

resource "aws_s3_bucket" "output" {
  bucket = "${var.project_name}-output-bucket"

  force_destroy = true
}
