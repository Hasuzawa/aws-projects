locals {
  cloudtrail_id = "cloudtrail.amazonaws.com"
}

// allow cloudtrail to write to bucket
data "aws_iam_policy_document" "cloudtrail" {
  statement {
    sid    = "cloudtrail-read-bucket-acl"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = [local.cloudtrail_id]
    }
    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.cloudtrail.arn]
  }

  statement {
    sid    = "cloudtrail-write-log-to-bucket"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = [local.cloudtrail_id]
    }
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.cloudtrail.arn}/*"]
  }
}

# for extra safety, you should restrict the source arn to only one cloudtrail, and the bucket resource to one IAM user

// assume role
data "aws_iam_policy_document" "flow_log" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

// for flow log to stream to cloudwatch log group
resource "aws_iam_role" "flow_log" {
  name               = "flow-log-to-cloudwatch-log-group"
  assume_role_policy = data.aws_iam_policy_document.flow_log.json
}

data "aws_iam_policy_document" "stream_to_log_group" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "attach_log_stream" {
  name   = "stream-to-log-group"
  role   = aws_iam_role.flow_log.id
  policy = data.aws_iam_policy_document.stream_to_log_group.json
}
