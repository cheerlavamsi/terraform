provider "aws" {
  alias  = "oregon"
  #version = "~> 2.0"
  #region  = "us-east-1"
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket          = "d42-student"
    key             = "terraform-remote-states/proj-01/terraform.tfstate"
    region          = "us-east-1"
    dynamodb_table  = "terraform-locking"
    #dynamodb_table = "terraform-up-and-running-locks"
  }
}