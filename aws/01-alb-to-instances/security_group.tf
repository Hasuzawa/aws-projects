resource "aws_security_group" "instance_security_group" {
  vpc_id      = aws_vpc.vpc.id
  name        = "from-alb-to-anywhere"
  description = "Allow all egress, only allow ingress from ALB"

  # to anywhere
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_groups = [
    ]
  }
}

resource "aws_security_group" "alb_security_group" {
  vpc_id      = aws_vpc.vpc.id
  name        = "from-internet-gateway-to-instances"
  description = "Ingress from internet gateway, egress to instance security group"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_groups = [
      aws_security_group.instance_security_group.id
    ]
  }
}
