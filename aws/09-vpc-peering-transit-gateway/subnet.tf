resource "aws_subnet" "subnets" {
  count             = length(var.vpcs)
  vpc_id            = aws_vpc.vpcs[count.index].id
  cidr_block        = var.vpcs[count.index].subnet_cidr
  availability_zone = var.vpcs[count.index].availability_zone
  tags = {
    Name = "subnet-${var.project_name}-${count.index}"
  }
}
