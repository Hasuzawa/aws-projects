resource "aws_ecs_cluster" "demo" {
  name = "demo-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "fargate" {
  cluster_name       = aws_ecs_cluster.demo.name
  capacity_providers = ["FARGATE"]
  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base              = 0
    weight            = 100 # all
  }
}
