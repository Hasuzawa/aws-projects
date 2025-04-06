data "aws_organizations_policy" "rcp_full_aws_access" {
  policy_id = "p-RCPFullAWSAccess"
}

data "aws_organizations_policy" "scp_full_aws_access" {
  policy_id = "p-FullAWSAccess"
}

# Tag Policy does not have a default full access policy
