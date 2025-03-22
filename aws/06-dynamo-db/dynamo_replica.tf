resource "aws_dynamodb_table" "replicated_table" {
  name     = "table-${var.project_name}"
  hash_key = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  # using autoscaling for read & write
  read_capacity    = 1
  write_capacity   = 1
  stream_enabled   = true # needed for replica
  stream_view_type = "NEW_AND_OLD_IMAGES"

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity,
      replica
    ]
  }
  provider = aws # it is recommended to explicity provide this for multi-region table
}

resource "aws_dynamodb_table_replica" "us" {
  global_table_arn = aws_dynamodb_table.replicated_table.arn
  provider         = aws.us
}

resource "aws_dynamodb_table_replica" "eu" {
  global_table_arn = aws_dynamodb_table.replicated_table.arn
  provider         = aws.eu
}
