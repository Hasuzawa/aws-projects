resource "aws_elastic_beanstalk_environment" "nodejs" {
  name                = "nodejs"
  application         = aws_elastic_beanstalk_application.nginx.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.5.1 running Node.js 22"
  description         = "Node.js 22 on Amazon Linux 2023"
}

resource "aws_elastic_beanstalk_environment" "python" {
  name                = "python"
  application         = aws_elastic_beanstalk_application.nginx.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.5.1 running Python 3.13"
  description         = "Python 3.13 on Amazon Linux 2023"
}
