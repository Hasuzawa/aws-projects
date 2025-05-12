resource "aws_elastic_beanstalk_configuration_template" "dev" {
  name        = "dev template"
  application = aws_elastic_beanstalk_application.dev.name
}
