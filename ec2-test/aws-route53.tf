data "aws_route53_zone" "dev" {
  provider     = "aws.us-east-1"
  name         = "${var.domain}"
  private_zone = false
}

resource "aws_route53_record" "front1" {
  provider = "aws.us-east-1"
  name     = "k1.${var.domain}"
  type     = "A"
  ttl      = 3600
  records  = ["${aws_instance.myinstance.public_ip}"]
  zone_id  = "${data.aws_route53_zone.dev.id}"
}


resource "aws_route53_record" "front2" {
  provider = "aws.us-east-1"
  name     = "k2.${var.domain}"
  type     = "A"
  ttl      = 3600
  records  = ["${aws_instance.myinstance.public_ip}"]
  zone_id  = "${data.aws_route53_zone.dev.id}"
}