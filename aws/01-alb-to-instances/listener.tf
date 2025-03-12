resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_listener_rule" "index" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "application load balancer is up and running"
      status_code  = 200
    }
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
