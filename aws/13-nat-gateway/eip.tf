# when using eip for nat gateway, the network border group must match that of the subnet it is in

resource "aws_eip" "eip" {
  domain               = "vpc"
  network_border_group = "ap-northeast-1"
  depends_on = [
    aws_internet_gateway.igw
  ]
  tags = {
    Name = "eip-${var.project_name}"
  }
}
