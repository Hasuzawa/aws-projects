locals {
	books = [
		data.local_file.hamlet.content,
		data.local_file.faust.content,
		data.local_file.les_miserables.content
	]
}

resource aws_dynamodb_table_item books {
	table_name = aws_dynamodb_table.book_table.name
	hash_key = aws_dynamodb_table.book_table.hash_key

	for_each = toset(local.books)
	item = each.value
}
