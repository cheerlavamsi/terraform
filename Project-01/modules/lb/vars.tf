variable "tags" {
  type = "map"
}
variable "SG_WEB_PUB" {}
variable "INSTANCE_IDS" {
  type = list
}
variable "PUBLIC_SUBNETS" {}
variable "LOG_BUCKET" {}
variable "VPCID" {}
variable "INSTANCE_COUNT" {}
