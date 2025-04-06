resource "aws_cloudwatch_event_bus" "demo" {
  name        = "demo-bus"
  description = "demo bus for showcasing event bridge"
  # event_source_name = ""
}
