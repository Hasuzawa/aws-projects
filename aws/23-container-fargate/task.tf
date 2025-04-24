data "local_file" "nginx_task" {
  filename = "./task/nginx.json"
}

resource "aws_ecs_task_definition" "nginx" {
  family                = "nginx-task"
  container_definitions = data.local_file.nginx_task.content
}
