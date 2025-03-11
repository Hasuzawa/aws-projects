resource "aws_lb_target_group" "alb_target_group" {
  vpc_id   = aws_vpc.vpc.id
  name     = "project-01-instances"
  protocol = "HTTP"
  port     = 80
}

resource "aws_lb_target_group_attachment" "instance1" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.instance1.id
}

resource "aws_lb_target_group_attachment" "instance2" {
  target_group_arn = aws_lb.alb.arn
  target_id        = aws_instance.instance2.id
}

resource "aws_lb_target_group_attachment" "instance3" {
  target_group_arn = aws_lb.alb.arn
  target_id        = aws_instance.instance3.id
}
