variable "ami" {}
variable "instance_type" {}
variable "tags" {
  type = map
}
variable "RDS_DB_SIZE" {}
variable "RDS_INSTANCE_TYPE" {}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}
variable "RDS_DBNAME" {}
variable "VPC_CIDR" {}
variable "AWS_REGION" {}
variable "VAULT_PASS" {}
variable "instance_count" {}
variable "SSH_USER" {}
variable "SSH_KEY" {}
variable "schema_bucket" {}




