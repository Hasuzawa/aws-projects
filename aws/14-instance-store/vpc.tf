resource aws_vpc vpc {
	cidr_block = "10.0.0.0/8"
	tags = {
		Name = "vpc"
	}
}

resource aws_subnet subnet {
	vpc_id = aws_vpc.vpc.id
	cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 16, 1)
	tags = {
		Name = "subnet"
	}
}
