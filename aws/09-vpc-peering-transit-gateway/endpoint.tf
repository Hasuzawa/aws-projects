# Although this is listed under VPC endpoint on console,
# it has the eice- as VPC endpoint ID,
# which is different from vpce- endpoints

# this can be used to connect to an ec2 in private subnet
resource "aws_ec2_instance_connect_endpoint" "endpoints" {
  count     = length(aws_subnet.subnets)
  subnet_id = aws_subnet.subnets[count.index].id

  tags = {
    Name = "ec2-connect-endpoint-${count.index}"
  }
}
