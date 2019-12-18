module "VPC" {
  source                    = "../modules/VPC"
  tags                      = var.tags
  VPC_CIDR                  = var.VPC_CIDR
}

variable "tags" {
  type = "map"
}

variable "VPC_CIDR" {}
