resource "aws_instance" "one_time_spot" {
  subnet_id     = aws_subnet.subnet.id
  private_ip    = cidrhost(aws_subnet.subnet.cidr_block, 7)
  ami           = data.aws_ami.latest_amazon_linux.image_id
  instance_type = "t2.micro"

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "terminate"
      max_price                      = 0.0050
      spot_instance_type             = "one-time"
    }
  }

  tags = {
    Name = "one-time-spot"
  }
}

resource "aws_instance" "persistent_spot" {
  subnet_id     = aws_subnet.subnet.id
  private_ip    = cidrhost(aws_subnet.subnet.cidr_block, 9)
  ami           = data.aws_ami.latest_amazon_linux.image_id
  instance_type = "t2.micro"

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      max_price                      = 0.0042
      spot_instance_type             = "persistent"
    }
  }

  tags = {
    Name = "persistent-spot"
  }
}
