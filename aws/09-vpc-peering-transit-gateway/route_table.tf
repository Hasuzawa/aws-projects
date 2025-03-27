resource aws_route_table rt0 {
	vpc_id = aws_vpc.vpcs[0].id
	route {
		cidr_block = "192.168.1.0/24"
		vpc_peering_connection_id = aws_vpc_peering_connection.peer0_1.id
	}

	tags = {
		Name = "rt-${var.project_name}-0"
	}
}

resource aws_route_table rt1 {
	vpc_id = aws_vpc.vpcs[1].id
	route {
		cidr_block = "192.168.0.0/24"
		vpc_peering_connection_id = aws_vpc_peering_connection.peer0_1.id
	}
	route {
		cidr_block = "192.168.2.0/24"
		vpc_peering_connection_id = aws_vpc_peering_connection.peer1_2.id
	}

	tags = {
		Name = "rt-${var.project_name}-1"
	}
}

resource aws_route_table rt2 {
	vpc_id = aws_vpc.vpcs[2].id

	tags = {
		Name = "rt-${var.project_name}-2"
	}
}
