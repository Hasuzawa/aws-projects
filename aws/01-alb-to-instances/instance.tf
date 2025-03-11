locals {
	ami = "ami-0599b6e53ca798bb2"	# 2023 Amazon Linux x86
	type = "t2.micro"
}

resource aws_instance instance1 {
	ami = local.ami
	private_ip = "192.168.0.0"
	instance_type = local.type
	tags = {
		Name = "project-01-subnet-01-instance-01"
	}
}

resource aws_instance instance2 {
	ami = local.ami
	private_ip = "192.168.1.1"
	instance_type = local.type
	tags = {
		Name = "project-01-subnet-02-instance-01"
	}
}

resource aws_instance instance3 {
	ami = local.ami
	private_ip = "192.168.2.1"
	instance_type = local.type
	tags = {
		Name = "project-01-subnet-03-instance-01"
	}
}
