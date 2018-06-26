resource "aws_route53_zone" "cluster" {
  name = "cluster1-k8s-sannikay.tk"
}

resource "aws_route53_record" "cluster" {
  zone_id = "${aws_route53_zone.cluster.zone_id}"
  name    = "cluster1-k8s-sannikay.tk"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.elastic_ip.public_ip}"]
}