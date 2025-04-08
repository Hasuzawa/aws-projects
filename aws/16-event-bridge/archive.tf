resource "aws_cloudwatch_event_archive" "archive" {
  name             = "${aws_cloudwatch_event_bus.demo.name}-archive"
  event_source_arn = aws_cloudwatch_event_bus.demo.arn
  description      = "archive for development eventbridge"
  retention_days   = 7
}

resource "aws_cloudwatch_event_archive" "indefinite_retention" {
  name             = "indefinite-retention"
  description      = "archive with indefinite retention"
  event_source_arn = aws_cloudwatch_event_bus.demo.arn
  retention_days   = 0 # 0 means archive forever
}

resource "aws_cloudwatch_event_archive" "default_archive" {
  name             = "default-archive"
  description      = "archive for default bus"
  event_source_arn = data.aws_cloudwatch_event_bus.default.arn
  retention_days   = 3
  event_pattern    = local.event_pattern_all
}

locals {
  # this would match all events
  event_pattern_all = jsonencode({
    "source" : [{
      "prefix" : ""
    }]
  })
}
