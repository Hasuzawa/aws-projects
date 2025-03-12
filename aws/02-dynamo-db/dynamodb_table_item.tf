resource "aws_dynamodb_table_item" "books" {
  table_name = aws_dynamodb_table.book_table.name
  hash_key   = aws_dynamodb_table.book_table.hash_key

  for_each = toset([for file in data.local_file.book_files : file.content])
  item     = each.value
}
