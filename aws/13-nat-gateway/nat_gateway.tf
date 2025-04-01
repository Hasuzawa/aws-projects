resource "aws_nat_gateway" "public_ngw" {
  subnet_id         = aws_subnet.public.id
  connectivity_type = "public"
  allocation_id     = aws_eip.eip.allocation_id
  tags = {
    Name = "ngw-public"
  }
}
