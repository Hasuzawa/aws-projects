# depending on destination, some options are not available and required permission is also different

// will monitor eni within the vpc
resource "aws_flow_log" "vpc_flow_log" {
  vpc_id                   = module.vpc.vpc.id
  traffic_type             = "ALL"
  max_aggregation_interval = 600 # default 600, in seconds
  log_destination          = aws_cloudwatch_log_group.log_group.arn
  iam_role_arn             = aws_iam_role.flow_log.arn	# allow log stream

  tags = {
	Name = "vpc-flow-log"
  }
}
