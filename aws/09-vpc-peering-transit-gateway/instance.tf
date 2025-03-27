resource "aws_instance" "instances" {
  count                = length(var.vpcs)
  ami                  = "ami-0599b6e53ca798bb2"
  subnet_id            = aws_subnet.subnets[count.index].id
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ssm_managed.name
  private_ip           = var.vpcs[count.index].instance_ipv4

  tags = {
    Name = "instance-${var.project_name}-${count.index}"
  }
}
