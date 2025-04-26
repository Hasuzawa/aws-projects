resource "aws_launch_template" "default" {
  name          = "t2-linux-instance"
  image_id      = "ami-05206bf8aecfc7ae6"
  instance_type = "t2.micro"
  description   = "template with default values"
}

resource "aws_autoscaling_group" "singleton" {
  name               = "singleton"
  min_size           = 1
  desired_capacity   = 1
  max_size           = 1
  availability_zones = ["ap-northeast-1a"]
  launch_template {
    id      = aws_launch_template.default.id
    version = "$Latest"
  }
}
