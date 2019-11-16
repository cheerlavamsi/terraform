module "DEV-EC2" {

 source         = "../modules/ec2/ec2"
 ami            = var.ami
 instance_type  = var.instance_type
 tags            = var.tag

}
