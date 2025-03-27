resource "aws_subnet" "subnets" {
  count             = length(var.vpcs)
  vpc_id            = aws_vpc.vpcs[count.index].id
  cidr_block        = var.vpcs[count.index].subnet_cidr
  availability_zone = var.vpcs[count.index].availability_zone
  tags = {
    Name = "subnet-${var.project_name}-${count.index}"
  }
}

locals {
  route_table_ids = [
    aws_route_table.rt0,
    aws_route_table.rt1,
    aws_route_table.rt2
  ]
}

resource aws_route_table_association asso {
  count = length(aws_subnet.subnets)
  subnet_id = aws_subnet.subnets[count.index].id
  route_table_id = local.route_table_ids[count.index].id
}
