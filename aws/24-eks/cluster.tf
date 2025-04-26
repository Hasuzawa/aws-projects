resource "aws_eks_cluster" "sample" {
  name     = "sample"
  role_arn = ""
  vpc_config {
    subnet_ids = data.aws_subnets.subnets.ids
  }
}
