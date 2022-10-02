variable "ami" {
  type = string
  default = "ami-026b57f3c383c2eec"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "network_interface_id" {
  type = string
  default = "network_id_from_aws"
}

variable "region" {
  default = "eu-east-1"
}

variable "account" {
  default = "123123123123"
}



