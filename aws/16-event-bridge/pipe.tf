resource "aws_pipes_pipe" "plain" {
  name        = "plain-pipe"
  description = "pipe that just route source to destination"
  role_arn    = aws_iam_role.sqs_full_access.arn
  source      = aws_sqs_queue.source.arn
  target      = aws_sqs_queue.destination.arn
  # these depend on the data source and target
  source_parameters {
    sqs_queue_parameters {
      batch_size                         = 5
      maximum_batching_window_in_seconds = 10
    }
  }
  target_parameters {
    # FIFO queue only
    sqs_queue_parameters {
      message_deduplication_id = "1"
      message_group_id         = "2"
    }
  }
}

resource "aws_pipes_pipe" "with_richment" {
  name        = "pipe-with-richment"
  description = "pipe with richment parameters, as well as source and target parameters"
  role_arn    = aws_iam_role.sqs_full_access.arn
  source      = aws_sqs_queue.source.arn
  target      = aws_sqs_queue.destination.arn

  # filter
  source_parameters {
    filter_criteria {
      filter {
        # this is a event pattern
        pattern = jsonencode({
          source = ["aws.s3"]
        })
      }
    }
  }
  # enrichment
  enrichment_parameters {
    http_parameters {
      header_parameters = {
        "Cache-Control" = "no-cache,no-store"
      }
      path_parameter_values = ["v2"]
      query_string_parameters = {
        "sid" : "123456"
        "view-id" : "789"
      }
    }
  }

  target_parameters {
    sqs_queue_parameters {
      message_deduplication_id = "3"
      message_group_id         = "4"
    }
  }
}
