# restrict tag value to some discrete value,
# enforce compliant for of tag for some resource

resource "aws_organizations_policy" "tag_policy" {
  name        = "tag-policy-terraform"
  description = "sample tag policy"
  type        = "TAG_POLICY"
  content     = local.policy_json
}

locals {
  # you can use both = and : syntax
  policy_json = jsonencode({
    "tags" : {
      "Department" : {
        "tag_value" : {
          "@@assign" : [
            "hr",
            "sales",
            "engineering"
          ]
        }
      }
      Environment : {
        tag_value : {
          "@@assign" : [
            "production",
            "stage",
            "development"
          ]
        }
      }
      CostCenter = {
        tag_key = {
          "@@assign" : "CostCenter"
        },
        enforced_for = {
          "@@assign" : [
            "s3:bucket"
          ]
        }
      }
    }
  })
}
