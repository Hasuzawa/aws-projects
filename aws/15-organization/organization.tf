# resource "aws_organizations_organization" "all_feature" {
#   feature_set = "ALL"
# }

# resource "aws_organizations_organization" "consolidated" {
#   feature_set = "CONSOLIDATED_BILLING"
# }

# the orgnization of the AWS user
data "aws_organizations_organization" "current" {
}




