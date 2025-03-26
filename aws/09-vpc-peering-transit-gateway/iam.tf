data "aws_iam_policy" "ssm_full_access" {
  name = "AmazonSSMFullAccess"
}

# delegate permission to ec2
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# this will be listed under IAM role
resource "aws_iam_role" "ec2_ssm_managed" {
  name               = "ssm_managed"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ssm_for_ec2" {
  role       = aws_iam_role.ec2_ssm_managed.name
  policy_arn = data.aws_iam_policy.ssm_full_access.arn
}

# this can be given to ec2 instances
resource "aws_iam_instance_profile" "ssm_managed" {
  name = "ssm_managed_ec2"
  role = aws_iam_role.ec2_ssm_managed.id
}
