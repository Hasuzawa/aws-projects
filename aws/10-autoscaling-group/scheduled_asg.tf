resource "aws_autoscaling_group" "scheduled" {
  name               = "scheduled"
  min_size           = 2
  max_size           = 4
  availability_zones = data.aws_availability_zones.available.names
  launch_template {
    name = aws_launch_template.simple.name
  }
}

resource "aws_autoscaling_schedule" "schedule" {
  scheduled_action_name  = "sudden-spike-on-christmas-2022"
  autoscaling_group_name = aws_autoscaling_group.scheduled.name
  min_size               = 6
  max_size               = 10
  desired_capacity       = 8
  start_time             = "2022-12-25T00:00:00Z"
  end_time               = "2022-12-26T00:00:00Z"
}

resource "aws_atuoscaling_schedule" "schedule" {
  scheduled_action_name = "increase-every-monday-9.00"
  min_size              = 3
  max_size              = 5
  desired_capacity      = -1 # use asg's original desired capacity
  recurrence            = "0 9 * * mon"
}
