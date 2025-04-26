resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx-task"
  container_definitions    = file("task/nginx.json")
  cpu                      = "0.5 vCPU"
  memory                   = "1 GB"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
}

resource "aws_ecs_task_definition" "multi_nginx" {
  family                = "multi-nginx-task"
  container_definitions = file("task/multi-nginx.json")
  # these two are task cpu and memory, not container cpu and memory
  cpu    = "1 vCPU"
  memory = "2 GB"

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}
