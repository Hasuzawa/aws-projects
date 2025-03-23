resource "aws_docdb_cluster_parameter_group" "default" {
  name        = "default"
  family      = "docdb5.0"
  description = "default parameter group when no values are set"
}

resource "aws_docdb_cluster_parameter_group" "pg" {
  name        = var.project_name
  family      = "docdb5.0"
  description = "parameter group for ${var.project_name}"
}
