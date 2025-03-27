resource "aws_vpc_peering_connection" "peer0_1" {
  vpc_id      = aws_vpc.vpcs[0].id
  peer_vpc_id = aws_vpc.vpcs[1].id
  auto_accept = true

  tags = {
    Name = "vpc peer between vpc-0 and vpc-1"
  }
}

resource "aws_vpc_peering_connection" "peer1_2" {
  vpc_id      = aws_vpc.vpcs[1].id
  peer_vpc_id = aws_vpc.vpcs[2].id
  auto_accept = true

  # requester {
  #   allow_remote_vpc_dns_resolution = true
  # }

  # accepter {
  #   allow_remote_vpc_dns_resolution = true
  # }

  tags = {
    Name = "vpc peer between vpc-1 and vpc-2"
  }
}
