// this can be used as a log destination for flow logs from vpc, subnet etc.
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "traffic-logs"
  log_group_class   = "STANDARD"
  retention_in_days = 7
}
