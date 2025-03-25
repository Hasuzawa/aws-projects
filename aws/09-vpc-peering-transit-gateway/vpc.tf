resource "aws_vpc" "vpcs" {
  count      = length(var.vpcs)
  cidr_block = var.vpcs[count.index].vpc_cidr
  tags = {
    Name = "vpc-peer-${var.project_name}-${count.index}"
  }
}
