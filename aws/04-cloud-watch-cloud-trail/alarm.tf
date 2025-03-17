locals {
  // for ref
  ge = "GreaterThanOrEqualToThreshold"
  gt = "GreaterThanThreshold"
  lt = "LessThanThreshold"
  le = "LessThanOrEqualToThreshold"

  // there are 3 more less common comparator
}

resource "aws_cloudwatch_metric_alarm" "ec2_high_cpu" {
  alarm_name          = "ec2-instance-high-cpu-usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3 // amount of datapoint satisfying the condition to alarm

  metric_name = "CPUUtilization" # this is given as 0 - 100
  statistic   = "Average"
  threshold   = 80
  period      = 60 // in seconds, many resource has min granularity

  namespace = "AWS/EC2" // select all ec2

  alarm_description = "metric monitoring ec2 cpu utilization"
}
