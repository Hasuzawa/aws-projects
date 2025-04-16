data "local_file" "simple_vpc" {
  filename = "template/simple-vpc.yml"
}

resource "aws_cloudformation_stack" "simple_vpc" {
  name               = "simple-vpc"
  template_body      = data.local_file.simple_vpc.content
  on_failure         = "DO_NOTHING"
  timeout_in_minutes = 5
}
