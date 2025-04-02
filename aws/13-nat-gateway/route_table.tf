resource "aws_route_table" "all_to_igw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "all-to-internet-gateway"
  }
}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.all_to_igw.id
  subnet_id      = aws_subnet.public.id
}

resource "aws_route_table" "all_to_ngw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_ngw.id
  }
  tags = {
    Name = "all-to-nat-gateway"
  }
}

# we only route one private subnet to NAT gateway, so only the instance-1 can access public internet
resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.all_to_ngw.id
  subnet_id      = aws_subnet.private[0].id
}
