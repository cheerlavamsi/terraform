data "aws_vpcs" "foo" {}

locals {
  vpcs = tolist(data.aws_vpcs.foo.ids)
}

data "aws_vpc" "foo" {
  count = length(local.vpcs)
  id    = element(local.vpcs, count.index)
}

variable "new" {
  type = "list"
  default = ["a", "b"]
}

output "foo" {
  value = length(data.aws_vpc.foo.*.arn)
}

output "new" {
  value = var.new[0]
}
