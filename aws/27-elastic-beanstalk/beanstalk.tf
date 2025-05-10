resource "aws_elastic_beanstalk_application" "nginx" {
  name        = "nginx-app"
  description = "nginx deployment as sample"
}
