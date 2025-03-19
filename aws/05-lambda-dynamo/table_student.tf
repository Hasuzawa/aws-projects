resource "aws_dynamodb_table" "student" {
  name     = "Student"
  hash_key = "Name"
  range_key = "Name"

  attribute {
    name = "Name"
    type = "S"
  }
}
