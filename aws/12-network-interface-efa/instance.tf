resource "aws_instance" "instance_0" {
  subnet_id  = aws_subnet.subnet.id
  private_ip = cidrhost(aws_subnet.subnet.cidr_block, 5)
  network_interface {
    network_interface_id = aws_network_interface.standard.id
    device_index         = 0
  }
}

resource "aws_intance" "instance_1" {
  subnet_id  = aws_subnet.subnet.id
  private_ip = cidrhost(aws_subnet.subnet.cidr_block, 7)
  network_interface {
    network_interface_id = aws_network_interface.standard.id
    device_index         = 2
  }
}
