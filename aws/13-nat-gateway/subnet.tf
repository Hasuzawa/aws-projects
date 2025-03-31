data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "region-name"
    values = ["ap-northeast-1"]
  }
}

resource "aws_subnet" "subnets" {
  count             = 3
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "subnet-${var.project_name}-${count.index}"
  }
}
