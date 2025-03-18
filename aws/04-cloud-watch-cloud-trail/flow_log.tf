
resource "aws_flow_log" "vpc_flow_log" {
  vpc_id                   = module.vpc.vpc.id
  traffic_type             = "ALL"
  max_aggregation_interval = 600 # default 600, in seconds
  log_destination          = aws_cloudwatch_log_group.log_group.arn

  destination_options {
    file_format        = "plain-text"
    per_hour_partition = false
  }
}
