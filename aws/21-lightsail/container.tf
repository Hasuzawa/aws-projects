resource "aws_lightsail_container_service" "s1" {
  name  = "container-service-1"
  power = "micro"
  scale = 1
}

resource "aws_lightsail_container_service_deployment_version" "c1" {
  service_name = aws_lightsail_container_service.s1.name
  container {
    container_name = "container-1"
    image          = "amazon/amazon-lightsail:nginx"
    ports = {
      80 = "HTTP"
    }
  }
  public_endpoint {
    container_name = "container-1"
    container_port = 80
    health_check {
      success_codes       = "200-499"
      path                = "/"
      interval_seconds    = 10
      timeout_seconds     = 2
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }
}
