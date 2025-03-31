# this instance can be used test connection to other instances

resource "aws_instance" "instance_1" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet.id
  private_ip    = cidrhost(aws_subnet.subnet.cidr_block, 7)
  tags = {
    Name = "ref-${var.project_name}"
  }
}
