# needed for dax to read and manage dynamo
data "aws_iam_role" "dynamo_db" {
  name = "AWSServiceRoleForDAX"
}
