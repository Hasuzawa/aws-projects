resource "aws_route53_zone" "public" {
  name    = "garden.com"
  comment = "public hosted zone"
}

resource "aws_route53_zone" "private" {
  name    = "home.com"
  comment = "private hosted zone"

  vpc {
    vpc_id = aws_vpc.tokyo.id
  }
}
