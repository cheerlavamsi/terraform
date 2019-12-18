resource "aws_vpc" "main" {
  cidr_block    = var.VPC_CIDR
  tags          = {
    Name        = "${var.tags["project_name"]}-${var.tags["env"]}-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id        = aws_vpc.main.id

  tags          = {
    Name        =  "${var.tags["project_name"]}-${var.tags["env"]}-igw"
  }
}
