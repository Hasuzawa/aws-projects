variable "project" {
  type        = string
  description = "The project number, e.g. 01, 13, 78"
}

variable "availability_zone" {
  type        = string
  description = "The AZ to place the subnet, e.g. ap-northeast-1a, us-west-2a"
}
