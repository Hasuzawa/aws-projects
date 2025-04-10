resource "aws_ebs_volume" "cache" {
  availability_zone = aws_instance.vgw_host.availability_zone
  size              = 150

  tags = {
    Name = "volume-gateway-cache"
  }
}

resource "aws_volume_attachment" "vgw" {
  instance_id = aws_instance.vgw_host.id
  device_name = "/dev/vdb"
  volume_id   = aws_ebs_volume.cache.id
}
