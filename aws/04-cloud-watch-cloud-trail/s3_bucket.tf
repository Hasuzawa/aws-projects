resource "aws_s3_bucket" "input" {
  bucket = "${var.project_name}-input-bucket"

  force_destroy = true
}

resource "aws_s3_bucket" "output" {
  bucket = "${var.project_name}-output-bucket"

  force_destroy = true
}

resource aws_s3_bucket cloudtrail {
  bucket = "${var.project_name}-cloudtrail"

  force_destroy = true
}

resource aws_s3_bucket_versioning input {
  bucket = aws_s3_bucket.input.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource aws_s3_bucket_versioning output {
  bucket = aws_s3_bucket.output.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource aws_s3_bucket_versioning cloudtrail {
  bucket = aws_s3_bucket.cloudtrail.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource aws_s3_bucket_policy cloudtrail {
  bucket = aws_s3_bucket.cloudtrail.id
  policy = data.aws_iam_policy_document.cloudtrail.json
}
