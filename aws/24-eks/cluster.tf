resource "aws_eks_cluster" "sample_1" {
  name     = "dev-cluster-1"
  version  = "1.32"
  role_arn = data.aws_iam_role.eks_auto_cluster.arn

  vpc_config {
    subnet_ids = data.aws_subnets.subnets.ids
  }

  kubernetes_network_config {
    service_ipv4_cidr = "10.100.0.0/16" # section in the vpc selected
    ip_family         = "ipv4"
  }
}

resource "aws_eks_cluster" "sample_2" {
  name     = "dev-cluster-2"
  version  = "1.32"
  role_arn = data.aws_iam_role.eks_auto_cluster.arn

  vpc_config {
    subnet_ids = data.aws_subnets.subnets.ids
  }

  kubernetes_network_config {
    service_ipv4_cidr = "10.100.0.0/16"
    ip_family         = "ipv4"
  }

  remote_network_config {
    remote_node_networks {
      cidrs = ["10.0.1.0/24"]
    }
    remote_pod_networks {
      cidrs = ["10.0.2.0/24"]
    }
  }

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP" # API mode required for remote network config
  }
}
