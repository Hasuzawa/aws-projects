resource "aws_docdb_subnet_group" "subnets" {
  name        = var.project_name
  description = "subnet group with created vpc and subnets"
  subnet_ids = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id,
    aws_subnet.subnet3.id
  ]
}
