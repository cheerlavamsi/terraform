module "ROUTE53" {
  source          = "../modules/route53"
  ALB_DNS_NAME    = var.ALB_DNS_NAME
}
