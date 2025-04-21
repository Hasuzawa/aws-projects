resource "aws_apprunner_service" "nginx" {
  service_name = "nginx-app"

  source_configuration {
    image_repository {
      image_repository_type = "ECR_PUBLIC"
      image_identifier      = "public.ecr.aws/nginx/nginx:latest"
      image_configuration {
        port = 80
      }
    }
    auto_deployments_enabled = false
  }

  instance_configuration {
    cpu    = "1 vCPU"
    memory = "2 GB" # can be in unit of MB or GB
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

  observability_configuration {
    observability_enabled = false
  }
}
