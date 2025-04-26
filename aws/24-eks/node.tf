resource "aws_eks_node_group" "nginx_nodes" {
  cluster_name    = aws_eks_cluster.sample.name
  node_group_name = "nginx-group"
  node_role_arn   = data.aws_iam_role.eks_auto_node.arn
  subnet_ids      = data.aws_subnets.subnets.ids
  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }
}
