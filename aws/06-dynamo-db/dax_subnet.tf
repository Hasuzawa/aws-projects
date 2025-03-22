# vpc is inferenced from the subnets
resource "aws_dax_subnet_group" "subnet" {
  name       = var.project_name
  subnet_ids = [
	module.vpc.subnet.id
  ]
}
