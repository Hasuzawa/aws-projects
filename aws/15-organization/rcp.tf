data "aws_iam_policy_document" "deny_sts" {
  statement {
    effect = "Deny"
    actions = [
      "sts:*"
    ]
    resources = ["*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_organizations_policy" "deny_sts" {
  name        = "deny-all-sts"
  description = "deny all actions on sts"
  type        = "RESOURCE_CONTROL_POLICY"
  content     = data.aws_iam_policy_document.deny_sts.json
}
