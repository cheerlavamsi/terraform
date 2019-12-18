resource "aws_route_table" "r" {
  vpc_id            = aws_vpc.main.id

  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.gw.id
  }

  tags = {
    Name            = "${var.tags["project_name"]}-${var.tags["env"]}-route-table"
  }
}
