resource "aws_autoscaling_group" "dev" {
  min_size           = 0
  max_size           = 0
  availability_zones = data.aws_availability_zones.available.names

  default_cooldown          = 60 # min interval between adjacent autoscaling
  default_instance_warmup   = 180 # time before instance contribute to metrics
  health_check_grace_period = 300                # default 300
  termination_policies      = ["OldestInstance"] # which instance to terminate first
  max_instance_lifetime     = 3 * 60 * 60 * 24   # 0, 1 - 365 day

  instance_maintenance_policy {
    min_healthy_percentage = 100
    max_healthy_percentage = 150
    # a larger difference means more instances can be replaced at the same time
  }
  # refresh here means update to instance config, ami etc. that will require change to instance
  instance_refresh {
    strategy = "Rolling"
    preferences {
      max_healthy_percentage = 120 # default 100
      min_healthy_percentage = 80  # default 90, lowest performance before aborting refresh
    }
  }
}
