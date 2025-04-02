data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "region-name"
    values = ["ap-northeast-1"]
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, 0)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "subnet-public-${var.project_name}"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, 1 + count.index)
  availability_zone = data.aws_availability_zones.available.names[1 + count.index]
  tags = {
    Name = "subnet-private-${var.project_name}-${count.index}"
  }
}
