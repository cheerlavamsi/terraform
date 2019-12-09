variable "ami" {}
variable "instance_type" {}
variable "tags" {
  type = map
}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}
variable "RDS_DBNAME" {}
variable "RDS_ENDPOINT" {}

variable "SG_SSH_PUB" {}
variable "SG_WEB_PUB" {}
variable "EC2-INSTANCE-PROFILE" {}

