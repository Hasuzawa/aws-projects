resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "192.168.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "subnet1-${var.project_name}"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "subnet2-${var.project_name}"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "subnet3-${var.project_name}"
  }
}
