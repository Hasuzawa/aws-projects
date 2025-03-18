# only outputs of a module can be referenced by parent module

output vpc {
	value = aws_vpc.vpc
}

output subnet {
	value = aws_subnet.subnet
}
