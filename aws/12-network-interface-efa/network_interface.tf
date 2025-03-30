resource "aws_network_interface" "standard" {
  subnet_id = aws_subnet.subnet.id
  interface_type = "interface"
  description = "standard network interface"
  tags = {
	Name = "eni-${var.project_name}"
  }
}
