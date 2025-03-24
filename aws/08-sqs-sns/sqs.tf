resource "aws_sqs_queue" "default" {
  name = "default"
}

resource "aws_sqs_queue" "fifo" {
  name                  = "${var.project_name}.fifo" # fifo queue must end with .fifo
  fifo_queue            = true
  fifo_throughput_limit = "perQueue" # perQueue / perMessageGroupId
  deduplication_scope   = "queue"    # queue / messageGroup
}

resource "aws_sqs_queue" "dev" {
  name             = "dev-${var.project_name}"
  max_message_size = 5 * 1024 # 1 - 256 kb

  receive_wait_time_seconds  = 5 # 0 - 20s. 0s means short polling
  visibility_timeout_seconds = 60
  message_retention_seconds  = 72 * 60 * 60 # 1 minute - 14 days
}

locals {
  redriveAllowAll = jsonencode({
    redrivePermission = "allowAll"
  })
  redriveDenyAll = jsonencode({
    redrivePermission = "denyAll"
  })
}

resource "aws_sqs_queue" "dlq" {
  name                 = "all-accepting-dead-letter-queue-${var.project_name}"
  redrive_allow_policy = local.redriveAllowAll
}

resource "aws_sqs_queue" "not_dlq" {
  name                 = "all-denying-dead-letter-queue-${var.project_name}"
  redrive_allow_policy = local.redriveDenyAll
}
