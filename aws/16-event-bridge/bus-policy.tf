# this would appear under the Permission tab of event bus
resource "aws_cloudwatch_event_bus_policy" "bus_policy" {
  event_bus_name = aws_cloudwatch_event_bus.demo.name
  policy         = data.aws_iam_policy_document.bus_policy.json
}

data "aws_iam_policy_document" "bus_policy" {
  statement {
    sid    = "AllowAllResourceToPutEvent"
    effect = "Allow"
    actions = [
      "events:PutEvents"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
  }
}
