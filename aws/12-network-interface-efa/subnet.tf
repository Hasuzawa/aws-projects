resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, 0)
  tags = {
    Name = "subnet-${var.project_name}"
  }
}
