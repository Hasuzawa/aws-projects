resource "aws_cloudformation_stack" "simple_vpc" {
  name               = "simple-vpc"
  template_body      = data.local_file.simple_vpc.content
  on_failure         = "DO_NOTHING"
  timeout_in_minutes = 5
}

resource "aws_cloudformation_stack" "parameter_and_output" {
  name          = "parameter-and-output"
  template_body = data.local_file.using_parameter.content
  parameters = {
    Name   = "Benjamin"
    Season = "Winter"
    Coin   = 13
  }
  on_failure = "ROLLBACK"
}
