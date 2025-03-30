# two instances with EFA interface. Only some instance types support EFA.

# only the more powerful instances support EFA
locals {
  instance_type = "c5n.9xlarge"
}

resource "aws_instance" "efa_instance_0" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = local.instance_type
  network_interface {
    network_interface_id = aws_network_interface.standard[2].id
    device_index         = 0
    network_card_index   = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.efa_only.id
    device_index         = 1
    network_card_index   = 0
  }
  tags = {
    Name = "instance-with-efa-${var.project_name}-0"
  }
}

resource "aws_instance" "efa_instance_1" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = local.instance_type
  network_interface {
    network_interface_id = aws_network_interface.standard[3].id
    device_index         = 0
    network_card_index   = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.efa_only.id
    device_index         = 1
    network_card_index   = 0
  }
  tags = {
    Name = "instance-with-efa-${var.project_name}-1"
  }
}
