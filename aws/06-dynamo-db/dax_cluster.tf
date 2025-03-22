# creating dax cluster is time-consuming
resource "aws_dax_cluster" "dev" {
  cluster_name         = var.project_name
  iam_role_arn         = data.aws_iam_role.dynamo_db.arn
  node_type            = "dax.t2.small" # there are t-type and r-type
  replication_factor   = 3
  subnet_group_name    = aws_dax_subnet_group.subnet.name
  parameter_group_name = aws_dax_parameter_group.dev.name
}
