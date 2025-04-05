data "aws_organizations_policy" "rcp_full_aws_access" {
  policy_id = "p-RCPFullAWSAccess"
}

data "aws_organizations_policy" "scp_full_aws_access" {
  policy_id = "p-FullAWSAccess"
}

# Tag Policy does not have a default full access policy

data "aws_iam_policy_document" "demo" {

}

resource "aws_organizations_policy" "deny_bedrock" {
  name        = "deny-all-bedrock"
  description = "deny all access to bedrock"
  type        = "RESOURCE_CONTROL_POLICY"
  content     = <<EOF
  EOF
}

resource "aws_organizations_policy" "deny_sts" {
  name        = "deny-all-sts"
  description = "deny all actions on sts"
  type        = "RESOURCE_CONTROL_POLICY"
  content     = <<EOF
  EOF
}
