ami                     = "ami-07e9dd794ba08fd2b"
instance_type           = "t2.small"
tags                    = {"project_name":"StudentApp","env":"DEV"}
RDS_DB_SIZE             = 20
RDS_INSTANCE_TYPE       = "db.t2.micro"
RDS_USERNAME            = "student"
RDS_PASSWORD            = "student1"
RDS_DBNAME              = "studentapp"
VPC_CIDR                = "10.0.20.0/16"
SNS_SUBSCRIPTION_EMAIL  =   ["chvamsi.devops@gmail.com"]
