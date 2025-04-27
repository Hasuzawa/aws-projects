// assume by eks cluster
data "aws_iam_role" "eks_auto_cluster" {
  name = "AmazonEKSAutoClusterRole"
}

data "aws_iam_role" "eks_auto_node" {
  name = "AmazonEKSAutoNodeRole"
}

// assume by node in node group
data "aws_iam_role" "eks_node_group" {
  name = "EKSNodeGroupRole"
}
