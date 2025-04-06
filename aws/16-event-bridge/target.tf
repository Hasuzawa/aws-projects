# resource aws_cloudwatch_event_target 
resource "aws_cloudwatch_event_target" "send_sign_in_event" {
  target_id      = "send-sign-in-event"
  event_bus_name = aws_cloudwatch_event_bus.demo.name
  rule           = aws_cloudwatch_event_rule.signin_events.name
  arn            = aws_sqs_queue.demo.arn
}

resource "aws_cloudwatch_event_target" "send_console_event" {
  target_id      = "send-console-event"
  event_bus_name = aws_cloudwatch_event_bus.demo.name
  rule           = aws_cloudwatch_event_rule.console_events.name
  arn            = aws_sqs_queue.demo.arn
}
