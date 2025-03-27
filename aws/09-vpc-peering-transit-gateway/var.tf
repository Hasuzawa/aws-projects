variable "project_name" {
  type        = string
  description = "the name of project"
}

variable "vpcs" {
  type = list(object({
    vpc_cidr          = string
    subnet_cidr       = string
    availability_zone = string
    instance_ipv4     = string
  }))
  description = "the vpcs to be connected by vpc peering"
}
