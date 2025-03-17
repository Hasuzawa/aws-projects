resource "aws_applicationinsights_application" "ec2" {
  resource_group_name = aws_resourcegroups_group.ec2.name
}

resource "aws_applicationinsights_application" "s3" {
  resource_group_name = aws_resourcegroups_group.s3.name
}
