resource "aws_ec2_instance_connect_endpoint" "eice" {
  subnet_id = aws_subnet.subnet.id
  tags = {
    Name = "eice"
  }
}
