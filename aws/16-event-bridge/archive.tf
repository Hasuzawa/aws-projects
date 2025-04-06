resource "aws_cloudwatch_event_archive" "archive" {
  name             = "${aws_cloudwatch_event_bus.demo.name}-archive"
  event_source_arn = aws_cloudwatch_event_bus.demo.arn
  description      = "archive for development eventbridge"
  retention_days   = 7
}
