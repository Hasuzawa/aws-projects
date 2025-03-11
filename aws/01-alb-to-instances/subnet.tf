resource aws_subnet subnet1 {
	vpc_id = aws_vpc.vpc.id
	availability_zone = "ap-northeast-1a"
	cidr_block = "192.168.0.0/24"
	tags = {
		Name = "project-01-subnet-1"
	}
}

resource aws_subnet subnet2 {
	vpc_id = aws_vpc.vpc.id
	availability_zone = "ap-northeast-1c"
	cidr_block = "192.168.1.0/24"
	tags = {
		Name = "project-01-subnet-2"
	}
}

resource aws_subnet subnet3 {
	vpc_id = aws_vpc.vpc.id
	availability_zone = "ap-northeast-1d"
	cidr_block = "192.168.2.0/24"
	tags = {
		Name = "project-01-subnet-3"
	}
}
