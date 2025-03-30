# instance with a primary interface and a secondary interface

resource "aws_instance" "instance_0" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = "t2.medium"
  # primary network interface
  network_interface {
    network_interface_id = aws_network_interface.standard[0].id
    device_index         = 0
    network_card_index   = 0
  }
  # secondary network interface
  network_interface {
    network_interface_id = aws_network_interface.standard[1].id
    device_index         = 1
    network_card_index   = 0
  }
  tags = {
    Name = "i-${var.project_name}-0"
  }
}
