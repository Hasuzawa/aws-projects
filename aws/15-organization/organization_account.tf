resource "aws_organizations_account" "jack" {
  name              = "jack"
  email             = "jack@aws.email.com"
  close_on_deletion = true
}

resource "aws_organizations_account" "mary" {
  name              = "mary"
  email             = "mary@aws.email.com"
  close_on_deletion = true
}
