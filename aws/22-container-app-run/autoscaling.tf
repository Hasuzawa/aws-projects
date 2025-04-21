resource "aws_apprunner_auto_scaling_configuration_version" "singleton" {
  auto_scaling_configuration_name = "singleton"
  min_size                        = 1
  max_size                        = 1
  max_concurrency                 = 50
}
