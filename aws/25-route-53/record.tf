# empty name would create record for the root domain name

resource "aws_route53_record" "a" {
  name    = "living-room"
  type    = "A"
  zone_id = aws_route53_zone.private.id
  ttl     = 3600 * 6
  records = ["192.0.2.235"]
}

resource "aws_route53_record" "aaaa" {
  name    = "kitchen"
  type    = "AAAA"
  zone_id = aws_route53_zone.private.id
  ttl     = 3600 * 6
  records = ["2001:0db8::8a2e:0370:bab5"]
}

resource "aws_route53_record" "cname" {
  name    = "bedroom"
  type    = "CNAME"
  zone_id = aws_route53_zone.private.id
  ttl     = 3600 * 6
  records = ["bedroom.com"]
}
