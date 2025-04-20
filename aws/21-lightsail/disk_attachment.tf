resource "aws_lightsail_disk_attachment" "attachment_1" {
  disk_name     = aws_lightsail_disk.d1.name
  instance_name = aws_lightsail_instance.i1.name
  disk_path     = "/dev/xvdf"
}

resource "aws_lightsail_disk_attachment" "attachment_2" {
  disk_name     = aws_lightsail_disk.d2.name
  instance_name = aws_lightsail_instance.i2.name
  disk_path     = "/dev/xcdg"
}
