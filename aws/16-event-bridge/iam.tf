# trust policy
data "aws_iam_policy_document" "trust" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["pipes.amazonaws.com", "scheduler.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "sqs_full_access" {
  name               = "${var.project_name}-sqs-full-access"
  assume_role_policy = data.aws_iam_policy_document.trust.json
}

# acl policy
data "aws_iam_policy" "sqs_full_access" {
  name = "AmazonSQSFullAccess"
}

resource "aws_iam_role_policy" "attachment" {
  role   = aws_iam_role.sqs_full_access.id
  policy = data.aws_iam_policy.sqs_full_access.policy
}
