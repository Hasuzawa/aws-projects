resource aws_security_group security_group {
	vpc_id = aws_vpc.vpc.id
	name = "from-alb-to-anywhere"
	description = "Allow all egress, only allow ingress from ALB"

	# to anywhere
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
	}

	ingress = []
}
