resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name}-dev-12345"
}

// Table Bucket

resource aws_s3tables_table_bucket dev {
	name = "${var.project_name}-dev-12345"
}
