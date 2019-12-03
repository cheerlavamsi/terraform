variable "RDS_DB_SIZE" {}
variable "RDS_INSTANCE_TYPE" {}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}
variable "RDS_DBNAME" {}
variable "tags" {
  type = map
}

variable "SG_RDS_MYSQL_INT" {}
variable "SERVER_FOR_SCHEMA" {}
