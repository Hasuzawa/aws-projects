resource "aws_cloudformation_stack_set" "demo" {
  name = "simple-stack-set"
  description = "one vpc, subnet and instance"
  template_body = data.local_file.simple_vpc.content
}
