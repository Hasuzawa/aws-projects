data "aws_iam_policy_document" "deny_bedrock" {
  statement {
    effect = "Deny"
    actions = [
      "bedrock:*"
    ]
    resources = ["*"]
  }
}

resource "aws_organizations_policy" "deny_bedrock" {
  name        = "deny-all-bedrock"
  description = "deny all access to bedrock"
  type        = "SERVICE_CONTROL_POLICY"
  content     = data.aws_iam_policy_document.deny_bedrock.json
}
