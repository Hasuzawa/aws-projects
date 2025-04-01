resource "aws_nat_gateway" "public_ngw" {
  subnet_id         = aws_subnet.public.id
  connectivity_type = "public"
  allocation_id     = aws_eip.eip.allocation_id
  tags = {
    Name = "ngw-public"
  }
}

# resource "aws_nat_gateway" "private_ngws" {
#   count             = 2
#   subnet_id         = aws_subnet.subnets[count.index + 1].id
#   connectivity_type = "private"
#   tags = {
#     Name = "ngw-private-${count.index}"
#   }
# }
