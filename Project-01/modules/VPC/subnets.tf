resource "aws_subnet" "public-subnets" {
  count                   = length(data.aws_availability_zones.available.zone_ids)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.VPC_CIDR, 8, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name                  = "${var.tags["project_name"]}-${var.tags["env"]}-public-subnet-${count.index+1}"
  }
}
