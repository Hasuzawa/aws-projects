resource "aws_dynamodb_table" "replicated_table" {
  name     = "table-${var.project_name}"
  hash_key = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  # using autoscaling for read & write

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity
    ]
  }
}

resource "aws_dynamodb_table_replica" "us" {
  global_table_arn = aws_dynamodb_table.replicated_table.arn
  provider         = aws.us
}

resource "aws_dynamodb_table_replica" "eu" {
  global_table_arn = aws_dynamodb_table.replicated_table.arn
  provider         = aws.eu
}
