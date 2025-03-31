resource "aws_network_interface" "standard" {
  count       = 4
  subnet_id   = aws_subnet.subnet.id
  description = "standard network interface"
  tags = {
    Name = "eni-${var.project_name}-${count.index}"
  }
}

resource "aws_network_interface" "efa_only" {
  subnet_id      = aws_subnet.subnet.id
  interface_type = "efa-only"
  description    = "elastic fabric adapter"
  tags = {
    Name = "efa-only-${var.project_name}"
  }
}
