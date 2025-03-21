resource "aws_dynamodb_table" "student" {
  name      = "Student"
  hash_key  = "Id"
  range_key = "Enrollment"

  attribute {
    type = "N"
    name = "Id"
  }
  attribute {
    type = "S"
    name = "Enrollment"
  }
  read_capacity  = 1
  write_capacity = 1
  point_in_time_recovery {
    enabled = true
  }
  import_table {
    input_format = "CSV"
    s3_bucket_source {
      bucket     = ""
      key_prefix = ""
    }
  }
}
