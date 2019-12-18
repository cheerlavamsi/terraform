module "VPC" {
  source                    = "../modules/vpc"
  tags                      = var.tags
  VPC_CIDR                  = var.VPC_CIDR
}

variable "tags" {
  type = "map"
}

variable "VPC_CIDR" {}
