resource aws_dynamodb_table student {
	name = "Student"
	hash_key = "Id"

	attribute {
		type = "N"
		name = "Id"
	}

}
