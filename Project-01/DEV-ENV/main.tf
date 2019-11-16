module "EC2" {
  source              = "../modules/ec2"
  ami                 =  var.ami
  instance_type       = var.instance_type
  tags                = var.tags
  RDS_ENDPOINT        = module.RDS.RDS_ENDPOINT
  RDS_USERNAME        = var.RDS_USERNAME
  RDS_PASSWORD        = var.RDS_PASSWORD
  RDS_DBNAME          = var.RDS_DBNAME
}

module "RDS" {
  source              = "../modules/rds"
  RDS_DB_SIZE         = var.RDS_DB_SIZE
  RDS_INSTANCE_TYPE   = var.RDS_INSTANCE_TYPE
  RDS_USERNAME        = var.RDS_USERNAME
  RDS_PASSWORD        = var.RDS_PASSWORD
  RDS_DBNAME          = var.RDS_DBNAME
  tags                = var.tags
  RDS_ENDPOINT        = var.RDS_ENDPOINT
}

