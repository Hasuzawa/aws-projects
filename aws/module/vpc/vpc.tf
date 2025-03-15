resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/20"

  tags = {
    Name = "project-${var.project}"
  }
}
