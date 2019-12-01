resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

output "vpc" {
  value = data.aws_default_vpc.id
}
