resource "aws_instance" "instance" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet.id
  tags = {
    Name = "instance-with-attached-volume"
  }
}

# the instance type must support multi-attach EBS
locals {
  sharable_type = "t3.micro"
}

resource "aws_instance" "instance_1" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = local.sharable_type
  subnet_id     = aws_subnet.subnet.id
  # this is instance store
  ephemeral_block_device {
    device_name  = "/dev/sdd"
    virtual_name = "ephemeral0"
  }
  tags = {
    Name = "instance-shared-mount-0"
  }
}

resource "aws_instance" "instance_2" {
  ami           = "ami-05506fa68391b4cb1"
  instance_type = local.sharable_type
  subnet_id     = aws_subnet.subnet.id
  ephemeral_block_device {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral2"
  }
  tags = {
    Name = "instance-shared-mount-1"
  }
}
