resource "aws_scheduler_schedule" "dev" {
  name       = "dev-schedule"
  group_name = aws_scheduler_schedule_group.dev.name

  # rate
  schedule_expression = "rate(3 hours)"

  # cron expression
  #   schedule_expression          = "5 * * * * *" # run at 0:05, 2:05, 4:05, ...
  schedule_expression_timezone = "Asia/Tokyo"
  flexible_time_window {
    mode                      = "FLEXIBLE"
    maximum_window_in_minutes = 30
  }

  target {
    arn      = aws_sqs_queue.destination.arn
    role_arn = aws_iam_role.sqs_full_access.arn
    # needed when using sqs as target
    sqs_parameters {
      message_group_id = "7"
    }
  }
}
