resource "aws_resourcegroups_group" "ec2" {
  name        = "ec2"
  description = "all ec2 instance"

  // tagfilters list seems to be required
  resource_query {
    query = jsonencode(
      {
        ResourceTypeFilters = [
          "AWS::EC2::Instance"
        ],
        TagFilters = [
          {
            Key    = "Environment"
            Values = ["*"]
          }
        ]
      }
    )
  }
}

resource "aws_resourcegroups_group" "s3" {
  name        = "s3"
  description = "all s3 bucket"

  resource_query {
    query = jsonencode(
      {
        ResourceTypeFilters = [
          "AWS::S3::Bucket"
        ],
        TagFilters = [
          {
            Key    = "Environment"
            Values = ["*"]
          }
        ]
      }
    )
  }
}

resource "aws_resourcegroups_group" "elb" {
  name        = "load-balancer"
  description = "all load balancer"

  resource_query {
    query = jsonencode(
      {
        ResourceTypeFilters = [
          "AWS::ElasticLoadBalancingV2::LoadBalancer"
        ],
        TagFilters = [
          {
            Key    = "Environment"
            Values = ["*"]
          }
        ]
      }
    )
  }
}
