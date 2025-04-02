resource "aws_ec2_instance_connect_endpoint" "endpoint" {
  subnet_id = aws_subnet.public.id
  tags = {
    Name = "eice-${var.project_name}"
  }
}
