resource "aws_s3_bucket" "data" {
  bucket = "${var.project_name}-data-for-dynamo-db"
}

data "local_file" "students" {
  filename = "./data/students.csv"
}

resource "aws_s3_object" "students" {
  bucket = aws_s3_bucket.data.bucket
  key    = "students.csv"
  source = data.local_file.students.filename
}
