resource "aws_vpc" "dev" {
  cidr_block = "192.168.0.0/20"

  tags = {
    Name = "vpc-${var.project_name}"
  }
}
