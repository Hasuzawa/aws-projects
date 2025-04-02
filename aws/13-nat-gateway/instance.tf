locals {
  subnets = concat(
    [aws_subnet.public],
    aws_subnet.private
  )
}

resource "aws_instance" "instances" {
  count         = length(local.subnets)
  ami           = "ami-05506fa68391b4cb1"
  instance_type = "t2.micro"
  subnet_id     = local.subnets[count.index].id
  tags = {
    Name = "i-${var.project_name}-${count.index}"
  }
}
