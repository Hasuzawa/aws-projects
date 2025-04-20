data "local_file" "simple_vpc" {
  filename = "template/simple-vpc.yml"
}

data "local_file" "using_parameter" {
  filename = "template/using-parameter-and-output.yml"
}
