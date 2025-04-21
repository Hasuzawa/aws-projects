resource "aws_apprunner_service" "nginx" {
  service_name = "nginx-app"

  source_configuration {
    image_repository {
      image_repository_type = "public.ecr.aws/nginx/nginx:latest"
      image_identifier      = "ECR_PUBLIC"
      image_configuration {
        port = 80
      }
    }
  }

  health_check_configuration {
    path                = "/"
    protocol            = "TCP"
    interval            = 5
    timeout             = 2
    healthy_threshold   = 1
    unhealthy_threshold = 5
  }

  network_configuration {
    ingress_configuration {
      is_publicly_accessible = true
    }
  }
}
