resource "aws_db_instance" "default" {
    allocated_storage   =   var.RDS_DB_SIZE
    storage_type        =   "gp2"
    engine              =   "mariadb"
    engine_version      =   "10.3"
    instance_class      =   var.RDS_INSTANCE_TYPE
    name                =   var.RDS_DBNAME
    username            =   var.RDS_USERNAME
    password            =   var.RDS_PASSWORD
    parameter_group_name=   "default.mariadb10.3"
    identifier          =   "${var.tags["Project_Name"]}-${var.tags["env"]}- mariadb"
  
}


