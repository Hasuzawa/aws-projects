// LOCATION not needed as 

resource aws_athena_named_query create_department {
	name = "create-department"
	workgroup = aws_athena_workgroup.dev.id
	database = aws_athena_database.dev.name
	query = <<-EOF
		CREATE IF NOT EXISTS table department (
			name string,
			established date
		)
		TBLPROPERTIES ( 'table_type' = 'ICEBERG' );
	EOF
	description = "Create department table"
}

resource aws_athena_named_query create_employee {
	name = "create-employee"
	workgroup = aws_athena_workgroup.dev.id
	database = aws_athena_database.dev.name
	query = <<-EOF
		CREATE IF NOT EXISTS table employee (
			name string,
			gender string,
			active boolean,
			salary int
		);
	EOF
	description = "Create employee table"
}
