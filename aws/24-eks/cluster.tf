resource "aws_eks_cluster" "sample" {
  name     = "sample"
  version  = "1.32"
  role_arn = data.aws_iam_role.eks_auto_cluster.arn

  vpc_config {
    subnet_ids = data.aws_subnets.subnets.ids
  }
}
