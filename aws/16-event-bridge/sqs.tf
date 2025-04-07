# as downstream for event bridge events
resource "aws_sqs_queue" "demo" {
  name                      = "event-bridge-downstream"
  message_retention_seconds = 60 * 60 * 72
}


resource "aws_sqs_queue" "source" {
  name                      = "pipe-source"
  message_retention_seconds = 3600
}

resource "aws_sqs_queue" "destination" {
  name                      = "pipe-destination.fifo"
  fifo_queue                = true
  message_retention_seconds = 3600
}
