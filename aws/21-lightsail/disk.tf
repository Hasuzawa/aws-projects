resource "aws_lightsail_disk" "d1" {
  name              = "disk-1"
  size_in_gb        = 8
  availability_zone = "ap-northeast-1a"
}

resource "aws_lightsail_disk" "d2" {
  name              = "disk-2"
  size_in_gb        = 8
  availability_zone = "ap-northeast-1c"
}
