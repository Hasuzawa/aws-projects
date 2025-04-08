resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/20"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/32"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, 0)
}

# the instance need a public ip address, else a vpc endpoint is needed
resource "aws_instance" "fgw_host" {
  ami                         = "ami-05506fa68391b4cb1"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "file-gateway-host"
  }
}
