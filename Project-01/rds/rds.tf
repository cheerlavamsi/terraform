resource "aws_db_instance" "default" {
    allocated_storage   =   var.RDS_DB_SIZE
    storage_type        =   "gp2"
    engine              =   "mysql"
    engine_version      =   "5.7"
    instance_class      =   var.RDS_INSTANCE_TYPE
    name                =   var.RDS_DBNAME
    username            =   var.RDS_USERNAME
    password            =   var.RDS_PASSWORD
    parameter_group_name=   "default.mysql5.7"
  
}
