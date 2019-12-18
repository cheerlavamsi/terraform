resource "aws_subnet" "public-subnets" {
  count                   = length(data.aws_availability_zones.available.zone_ids)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.VPC_CIDR, 8, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name                  = "${var.tags["project_name"]}-${var.tags["env"]}-public-subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count                   = length(data.aws_availability_zones.available.zone_ids)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.VPC_CIDR, 8, count.index+length(data.aws_availability_zones.available.zone_ids))

  tags = {
    Name                  = "${var.tags["project_name"]}-${var.tags["env"]}-private-subnet-${count.index+1}"
  }
}


resource "aws_route_table_association" "a" {
  count                   = length(data.aws_availability_zones.available.zone_ids)
  subnet_id               = element(aws_subnet.public-subnets.*.id, count.index )
  route_table_id          = aws_route_table.r.id
}
