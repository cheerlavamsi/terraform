terraform {
  backend "s3" {
    bucket          = "d42-student"
    key             = "terraform-remote-states/proj-01/test/terraform.tfstate"
    region          = "us-east-1"
    dynamodb_table  = "terraform-locking"
    #dynamodb_table = "terraform-up-and-running-locks"
  }
}