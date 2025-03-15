data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "replication" {
  name               = "s3-iam-role-replication"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

locals {
  source_arn = aws_s3_bucket.public_bucket.arn
  dest_arn   = aws_s3_bucket.private_bucket.arn
}

# This is the policy needed for replicating bucket data
data "aws_iam_policy_document" "replication" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket"
    ]

    resources = [local.source_arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging"
    ]

    # allow object access to source bucket
    resources = ["${local.source_arn}/*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags"
    ]

    # allow creating, deleting, tagging objects in destination object
    resources = ["${local.dest_arn}/*"]
  }
}

resource "aws_iam_policy" "replication" {
  name   = "public-to-private-s3-replication"
  policy = data.aws_iam_policy_document.replication.json
}

# This role can be used in s3 replication
resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}

# poblicy_document -> assume_role
# policy_document -> iam_policy -> replication_role
