resource "aws_ecs_service" "nginx_service" {
  name             = "nginx-service"
  cluster          = aws_ecs_cluster.demo.id
  launch_type      = "FARGATE"
  platform_version = "LATEST"
  desired_count    = 1
  task_definition  = aws_ecs_task_definition.nginx.id
  network_configuration {
    subnets = [data.aws_subnet.apne1_az1.id]
  }
}

# resource "aws_ecs_service" "multi_nginx_service" {
#   name             = "multi-nginx-service"
#   cluster          = aws_ecs_cluster.demo.id
#   launch_type      = "FARGATE"
#   platform_version = "latest"
#   desired_count    = 1
#   task_definition  = aws_ecs_task_definition.multi_nginx.id
#   placement_constraints {
#     type = ""
#   }
# }

# resource "aws_ecs_service" "mixed_service" {
#   name          = "nginx-mixed-service"
#   cluster       = aws_ecs_cluster.fargate.id
#   desired_count = 2
#   capacity_provider_strategy {
#     capacity_provider = "FARGATE"
#     base              = 0
#     weight            = 50
#   }
#   capacity_provider_strategy {
#     capacity_provider = "FARGATE_SPOT"
#     base              = 0
#     weight            = 50
#   }
# }
