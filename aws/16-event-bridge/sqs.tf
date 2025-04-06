# as downstream for event bridge events
resource "aws_sqs_queue" "demo" {
  name                      = "event-bridge-downstream"
  message_retention_seconds = 60 * 60 * 72
}
