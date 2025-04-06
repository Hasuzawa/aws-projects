resource "aws_cloudwatch_event_rule" "console_events" {
  name           = "aws-console"
  event_bus_name = aws_cloudwatch_event_bus.demo.name
  description    = "aws console"

  event_pattern = jsonencode({
    source = ["aws.console"]
  })
}

resource "aws_cloudwatch_event_rule" "signin_events" {
  name           = "aws-signin"
  event_bus_name = aws_cloudwatch_event_bus.demo.name
  description    = "aws signin"

  event_pattern = jsonencode({
    source = ["aws.signin"]
  })
}

resource "aws_cloudwatch_event_rule" "all_events" {
  name           = "all-events"
  event_bus_name = data.aws_cloudwatch_event_bus.default.name
  description    = "all events"
  event_pattern = jsonencode({
    source = [{
      prefix = ""
    }]
  })
}

# resource "aws_cloudwatch_event_rule" "s3_events" {
#   name           = "s3"
#   event_bus_name = aws_cloudwatch_event_bus.demo.name
#   description    = "s3 events"

#   event_pattern = jsonencode({
#     source = ["aws.s3"]
#   })
# }

# resource "aws_cloudwatch_event_rule" "scheduled" {
#   event_bus_name      = "default"
#   schedule_expression = "cron(0 0 * * ? *)"
# }
