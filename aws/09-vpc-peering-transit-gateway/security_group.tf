resource aws_security_group sg0 {
	vpc_id = aws_vpc.vpcs[0].id
	
	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = [aws_vpc.vpcs[1].cidr_block]
		description = "allow ingress from vpc-1"
	}

	tags = {
		Name = "sg-${var.project_name}-0"
	}
}
