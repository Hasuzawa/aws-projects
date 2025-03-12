resource "aws_lb" "alb" {
  name               = "project-01-internet-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.alb_security_group.id
  ]
  subnets = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id,
    aws_subnet.subnet3.id,
  ]
}
