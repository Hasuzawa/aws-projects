resource "aws_autoscaling_group" "mixed_weighted" {
  name               = "mixed-instances-weighted"
  min_size           = 4
  max_size           = 8
  availability_zones = data.aws_availability_zones.available.names

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_name = aws_launch_template.asg.name
      }
      override {
        instance_type     = "t2.nano"
        weighted_capacity = 1
      }

      override {
        instance_type     = "t2.micro"
        weighted_capacity = 2
      }

      override {
        instance_type     = "t2.small"
        weighted_capacity = 1
      }
    }
  }
  # unlike most AWS resources, this tag can be for this ASG or launched instances
  tag {
    key                 = "Instance Policy"
    value               = "mixed"
    propagate_at_launch = false
  }
  tag {
    key                 = "ASG"
    value               = "mixed-instances-weighted"
    propagate_at_launch = true
  }
}
