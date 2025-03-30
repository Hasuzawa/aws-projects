resource "aws_kinesis_firehose_delivery_stream" "default" {
  name        = "firehose-saved-to-s3"
  destination = "extended_s3"
  extended_s3_configuration {
    bucket_arn = aws_s3_bucket.demo.arn
    role_arn   = aws_iam_role.demo.arn
  }
}

# used as data source for firehose
resource "aws_kinesis_stream" "to_firehose" {
  name        = "to-firehose"
  shard_count = 2
  stream_mode_details {
    stream_mode = "PROVISIONED"
  }
}

# used as destination for firehose
resource "aws_s3_bucket" "demo" {
  bucket = "${var.project_name}-for-kinesis-firehose"
}
