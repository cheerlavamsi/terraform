variable "tags" {
  type = map
}

variable "PRIVATE_SUBNETS" {
  type    = "list"
}

variable "SG_ES_INT" {}
variable "ami" {}

variable "PUBLIC_SUBNETS" {
  type  = "list"
}
variable "SG_SSH_PUB" {}
variable "SG_WEB_PUB" {}
variable "SSH_USER" {}
variable "SSH_KEY" {}
