resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

output "vpc" {
  value = aws_default_vpc.default.id
}
