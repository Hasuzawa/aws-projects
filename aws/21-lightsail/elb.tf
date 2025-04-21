resource "aws_lightsail_lb" "elb1" {
  name          = "elb-1"
  instance_port = 80
}

resource "aws_lightsail_lb_attachment" "a1" {
  lb_name       = aws_lightsail_lb.elb1.name
  instance_name = aws_lightsail_instance.i1.name
}

resource "aws_lightsail_lb_attachment" "a2" {
  lb_name       = aws_lightsail_lb.elb1.name
  instance_name = aws_lightsail_instance.i2.name
}
