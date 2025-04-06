resource "aws_organizations_policy_attachment" "hardware" {
  policy_id = aws_organizations_policy.deny_bedrock.id
  target_id = aws_organizations_organizational_unit.hardware.id
}

resource "aws_organizations_policy_attachment" "software" {
  policy_id = aws_organizations_policy.deny_sts.id
  target_id = aws_organizations_organizational_unit.software.id
}
