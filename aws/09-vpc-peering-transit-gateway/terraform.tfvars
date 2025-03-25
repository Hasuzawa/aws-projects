project_name = "project-09"
vpcs = [
  {
    vpc_cidr          = "192.168.0.0/24"
    subnet_cidr       = "192.168.0.0/28"
    availability_zone = "ap-northeast-1a"
    instance_ipv4     = "192.168.0.5"
  },
  {
    vpc_cidr          = "192.168.1.0/24"
    subnet_cidr       = "192.168.1.0/28"
    availability_zone = "ap-northeast-1c"
    instance_ipv4     = "192.168.1.5"
  },
  {
    vpc_cidr          = "192.168.2.0/24"
    subnet_cidr       = "192.168.2.0/28"
    availability_zone = "ap-northeast-1d"
    instance_ipv4     = "192.168.2.5"
  }
]
