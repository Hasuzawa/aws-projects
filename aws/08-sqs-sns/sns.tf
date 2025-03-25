resource "aws_sns_topic" "default" {
  name = "default"
}

resource "aws_sns_topic" "fifo" {
  name       = "topic.fifo"
  fifo_topic = true
}

# note: you cannot remove resource with an archive policy
resource "aws_sns_topic" "retain" {
  name       = "retain-in-archive.fifo"
  fifo_topic = true
  archive_policy = jsonencode({
    MessageRetentionPeriod = 30
  })
}
