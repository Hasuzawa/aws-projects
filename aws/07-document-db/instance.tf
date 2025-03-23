resource "aws_docdb_cluster_instance" "instance1" {
  identifier         = "instance-${var.project_name}-${aws_subnet.subnet1.availability_zone}"
  cluster_identifier = aws_docdb_cluster.cluster.id
  availability_zone  = aws_subnet.subnet1.availability_zone
  instance_class     = "db.t3.medium"
  apply_immediately  = true
}

resource "aws_docdb_cluster_instance" "instance2" {
  identifier         = "instance-${var.project_name}-${aws_subnet.subnet2.availability_zone}"
  cluster_identifier = aws_docdb_cluster.cluster.id
  availability_zone  = aws_subnet.subnet2.availability_zone
  instance_class     = "db.t3.medium"
  apply_immediately  = true
}

resource "aws_docdb_cluster_instance" "instance3" {
  identifier         = "instance-${var.project_name}-${aws_subnet.subnet3.availability_zone}"
  cluster_identifier = aws_docdb_cluster.cluster.id
  availability_zone  = aws_subnet.subnet3.availability_zone
  instance_class     = "db.t3.medium"
  apply_immediately  = true
}
