data "aws_iam_policy_document" "firehose_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "demo" {
  name               = "kinesis-firehose-full-access"
  assume_role_policy = data.aws_iam_policy_document.firehose_assume_role.json
}

data "aws_iam_policy" "kinesis_full_access" {
  name = "AmazonKinesisFirehoseFullAccess"
}

resource "aws_iam_role_policy_attachment" "ssm_for_ec2" {
  role       = aws_iam_role.demo.name
  policy_arn = data.aws_iam_policy.kinesis_full_access.arn
}
