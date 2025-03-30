resource "aws_network_interface" "standard" {
  subnet_id   = aws_subnet.subnet.id
  description = "standard network interface"
  tags = {
    Name = "eni-${var.project_name}"
  }
}

resource "aws_network_interface" "trunk" {
  subnet_id      = aws_subnet.subnet.id
  interface_type = "trunk"
  tags = {
    Name = "trunk-${var.project_name}"
  }
}

resource "aws_network_interface" "efa" {
  subnet_id      = aws_subnet.subnet.id
  interface_type = "efa"
  tags = {
    Name = "efa-${var.project_name}"
  }
}

resource "aws_network_interface" "efa" {
  subnet_id      = aws_subnet.subnet.id
  interface_type = "efa-only"
  tags = {
    Name = "efa-only-${var.project_name}"
  }
}
