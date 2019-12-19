resource "aws_db_instance" "default" {
  allocated_storage         = var.RDS_DB_SIZE
  storage_type              = "gp2"
  engine                    = "mariadb"
  engine_version            = "10.3"
  instance_class            = var.RDS_INSTANCE_TYPE
  name                      = var.RDS_DBNAME
  username                  = var.RDS_USERNAME
  password                  = var.RDS_PASSWORD
  parameter_group_name      = "default.mariadb10.3"
  identifier                = "${lower(var.tags["project_name"])}-${lower(var.tags["env"])}-mariadb"
  vpc_security_group_ids    = [var.SG_RDS_MYSQL_INT]
  skip_final_snapshot       = true
  db_subnet_group_name      = aws_db_subnet_group.mariadb-subnet-group.name
}



