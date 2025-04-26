data "aws_iam_role" "eks_auto_cluster" {
  name = "AmazonEKSAutoClusterRole"
}

data "aws_iam_role" "eks_auto_node" {
  name = "AmazonEKSAutoNodeRole"
}
