resource "aws_route53_record" "www-marklogic-enterprise-api-elb" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "marklogicenterpriseapi.stage.qhanalytics.net"
  type    = "A"

  alias {
    name                   = aws_elb.marklogic-enterprise-api-elb.dns_name
    zone_id                = aws_elb.marklogic-enterprise-api-elb.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_zone" "primary" {
  name = "herman-testing.com"
}