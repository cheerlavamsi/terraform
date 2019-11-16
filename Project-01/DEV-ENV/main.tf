module "EC2" {
  source        = "../modules/ec2"
  ami           =  var.ami
  instance_type = instance_type
}
