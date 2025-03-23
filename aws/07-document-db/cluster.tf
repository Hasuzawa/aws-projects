resource "aws_docdb_cluster" "cluster" {
  cluster_identifier = "cluster-${var.project_name}"
  availability_zones = [
    aws_subnet.subnet1.availability_zone,
    aws_subnet.subnet2.availability_zone,
    aws_subnet.subnet3.availability_zone
  ]
  db_cluster_parameter_group_name = aws_docdb_subnet_group.subnets.name
  db_subnet_group_name            = aws_docdb_subnet_group.subnets.name
  master_username                 = "root"           # this is visible on AWS console
  master_password                 = var.project_name # >= 8 chars
  backup_retention_period         = 3
  apply_immediately               = true

  skip_final_snapshot       = false
  final_snapshot_identifier = "final-snapshot-${var.project_name}"
}
