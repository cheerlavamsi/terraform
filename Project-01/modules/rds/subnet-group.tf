resource "aws_db_subnet_group" "mariadb-subnet-group" {
  name          = "mariadb-subnet-group"
  subnet_ids    = var.PRIVATE_SUBNETS

  tags = {
    Name        = "mariadb-subnet-group"
  }
}
