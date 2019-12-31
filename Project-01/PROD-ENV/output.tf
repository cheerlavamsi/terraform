resource "local_file" "alb" {
  filename = "/tmp/alb"
  content  = module.LB.ALB_DNS_NAME
}
