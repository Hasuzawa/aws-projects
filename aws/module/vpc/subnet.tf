resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.0.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project_name}-subnet-1"
  }
}
