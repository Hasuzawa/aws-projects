locals {
  book_table_pk = "Id"

  author_table_pk = "Id"
}

resource "aws_dynamodb_table" "book_table" {
  name     = "Book"
  hash_key = local.book_table_pk

  table_class = "STANDARD"

  range_key = "YearPublished"

  local_secondary_index {
    name            = "AuthorIndex"
    range_key       = "Author"
    projection_type = "KEYS_ONLY"
  }

  attribute {
    name = local.book_table_pk
    type = "S"
  }

  # attribute {
  # 	name = "Name"
  # 	type = "S"
  # }

  attribute {
    name = "Author"
    type = "S"
  }

  # attribute {
  # 	name = "Language"
  # 	type = "S"
  # }

  attribute {
    name = "YearPublished"
    type = "N"
  }

  billing_mode   = "PROVISIONED"
  read_capacity  = 100
  write_capacity = 100
}

resource "aws_dynamodb_table" "author_table" {
  name     = "Author"
  hash_key = local.author_table_pk

  table_class = "STANDARD"

  range_key = "Name"

  attribute {
    name = local.author_table_pk
    type = "S"
  }

  attribute {
    name = "Name"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
  on_demand_throughput {
    max_read_request_units  = 10
    max_write_request_units = 10
  }
}
