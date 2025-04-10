resource "aws_storagegateway_gateway" "file_gateway" {
  gateway_name       = "demo-file-gateway"
  gateway_timezone   = "GMT+9:00" # Asia/Tokyo
  gateway_type       = "FILE_S3"
  gateway_ip_address = aws_instance.fgw_host.public_ip # address of an ec2 instance

  tags = {
    Name = "file-gateway"
  }
}
