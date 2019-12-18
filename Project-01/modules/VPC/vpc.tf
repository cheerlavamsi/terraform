resource "aws_vpc" "main" {
  cidr_block    = var.VPC_CIDR
  tags          = {
    Name        = "${var.tags["project_name"]}-${var.tags["env"]}-vpc"
  }
}
