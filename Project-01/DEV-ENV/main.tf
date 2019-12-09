module "EC2" {
  source                = "../modules/ec2"
  ami                   = var.ami
  instance_type         = var.instance_type
  tags                  = var.tags
  RDS_ENDPOINT          = module.RDS.RDS_ENDPOINT
  RDS_USERNAME          = var.RDS_USERNAME
  RDS_PASSWORD          = var.RDS_PASSWORD
  RDS_DBNAME            = var.RDS_DBNAME
  SG_SSH_PUB            = module.SG.SG_SSH_PUB
  SG_WEB_PUB            = module.SG.SG_WEB_PUB
  EC2-INSTANCE-PROFILE  = module.IAM.EC2-INSTANCE-PROFILE
  AWS_REGION            = var.AWS_REGION
}

module "RDS" {
  source              = "../modules/rds"
  RDS_DB_SIZE         = var.RDS_DB_SIZE
  RDS_INSTANCE_TYPE   = var.RDS_INSTANCE_TYPE
  RDS_USERNAME        = var.RDS_USERNAME
  RDS_PASSWORD        = var.RDS_PASSWORD
  RDS_DBNAME          = var.RDS_DBNAME
  tags                = var.tags
  SG_RDS_MYSQL_INT    = module.SG.SG_RDS_MYSQL_INT
  SERVER_FOR_SCHEMA   = module.EC2.SERVER_FOR_SCHEMA

  //providers = {
  //  aws = aws.oregon
  //}
}

module "SG" {
  source                = "../modules/sg"
  VPC_CIDR              = var.VPC_CIDR
}

module "SNS" {
  source                  = "../modules/sns"
  SNS_SUBSCRIPTION_EMAIL  = var.SNS_SUBSCRIPTION_EMAIL
  
}

module "CLOUDWATCH" {
  source                    = "../modules/cloudwatch"
  tags                      = var.tags
  SERVER_ID                 = module.EC2.SERVER_ID
  SNS_ARN                   = module.SNS.SNS_ARN
}

module "IAM" {
  source                    = "../modules/iam"
  tags                      = var.tags
}


