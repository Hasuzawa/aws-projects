resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/20"
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, 0)
}
