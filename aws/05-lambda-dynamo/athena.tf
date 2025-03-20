locals {
  workgroup = replace("${var.project_name}-dev-workgroup", "-", "_")
  database  = replace("${var.project_name}-dev-database", "-", "_")
}

# default workgroup is called primary
resource "aws_athena_workgroup" "dev" {
  name        = local.workgroup
  description = "dev workspace for project-05"

  configuration {
    bytes_scanned_cutoff_per_query = 10 * 1024 * 1024

    result_configuration {
      output_location = "s3://${aws_s3_bucket.bucket.bucket}/query-results/"	# the last / is needed
    }
  }
}

# this will belong to the default 'None' catalog
resource "aws_athena_database" "dev" {
  name   = local.database
  bucket = aws_s3_bucket.bucket.id
}
