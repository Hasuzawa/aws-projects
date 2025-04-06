resource "aws_organizations_account" "jack" {
  name              = "jack"
  email             = "jack@aws.email.com"
  parent_id         = aws_organizations_organizational_unit.hardware.id
  close_on_deletion = true
}

resource "aws_organizations_account" "mary" {
  name              = "mary"
  email             = "mary@aws.email.com"
  parent_id         = aws_organizations_organizational_unit.software.id
  close_on_deletion = true
}
