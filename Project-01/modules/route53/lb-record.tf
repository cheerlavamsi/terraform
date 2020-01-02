resource "aws_route53_record" "alb" {
  zone_id = "Z39HV6OGLH77Y9"
  name    = "studentapp-prod"
  type    = "CNAME"
  ttl     = "10"
  records = [var.ALB_DNS_NAME]
}
