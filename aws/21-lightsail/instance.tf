resource "aws_lightsail_instance" "i1" {
  name              = "nginx-instance"
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "nginx"
  bundle_id         = "micro_3_0"
}

resource "aws_lightsail_instance" "i2" {
  name              = "nginx-instance"
  availability_zone = "ap-northeast-1c"
  blueprint_id      = "nginx"
  bundle_id         = "micro_3_0"
}
