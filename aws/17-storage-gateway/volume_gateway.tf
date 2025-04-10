resource "aws_storagegateway_gateway" "volume_gateway" {
  gateway_name       = "demo-volume-gateway"
  gateway_timezone   = "GMT+9:00"
  gateway_type       = "CACHED" # or STORED
  gateway_ip_address = aws_instance.vgw_host.public_ip

  tags = {
    Name = "volume-gateway"
  }
}

data "aws_storagegateway_local_disk" "dev" {
  disk_path   = aws_volume_attachment.vgw.device_name
  gateway_arn = aws_storagegateway_gateway.volume_gateway.arn
}

resource "aws_storagegateway_cache" "vgw" {
  disk_id     = data.aws_storagegateway_local_disk.dev.id
  gateway_arn = aws_storagegateway_gateway.volume_gateway.arn
}
