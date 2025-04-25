resource "aws_ecs_capacity_provider" "asg_provider" {
  name = "asg-provider"
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.singleton.arn
    managed_draining       = "ENABLED"
    managed_scaling {
      target_capacity           = 80
      instance_warmup_period    = 300
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 10
      status                    = "ENABLED"
    }
  }
}
