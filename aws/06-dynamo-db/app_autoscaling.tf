resource "aws_appautoscaling_target" "dynamodb_read" {
  resource_id        = "table/${aws_dynamodb_table.replicated_table.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
  min_capacity       = 1
  max_capacity       = 5
}

resource "aws_appautoscaling_policy" "dynamodb_read_policy" {
  name = "maintain-optimal-read-usage"

  resource_id        = aws_appautoscaling_target.dynamodb_read.resource_id
  service_namespace  = aws_appautoscaling_target.dynamodb_read.service_namespace
  scalable_dimension = aws_appautoscaling_target.dynamodb_read.scalable_dimension

  policy_type = "TargetTrackingScaling"
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70.0
  }
}

resource "aws_appautoscaling_target" "dynamodb_write" {
  resource_id        = "table/${aws_dynamodb_table.replicated_table.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
  min_capacity       = 2
  max_capacity       = 6
}

resource "aws_appautoscaling_policy" "dynamodb_write_policy" {
  name = "maintain-optimal-write-usage"

  resource_id        = aws_appautoscaling_target.dynamodb_write.resource_id
  service_namespace  = aws_appautoscaling_target.dynamodb_write.service_namespace
  scalable_dimension = aws_appautoscaling_target.dynamodb_write.scalable_dimension

  policy_type = "TargetTrackingScaling"
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 80.0
  }
}
