resource "aws_ec2_instance_connect_endpoint" "endpoint" {
  subnet_id = aws_subnet.subnet.id
  tags = {
    Name = "eice-${var.project_name}"
  }
}
