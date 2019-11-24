provider "aws" {
  alias  = "oregon"
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "d42-resources"
    key    = "terraform-remote-states/proj-01/terraform.tfstate"
    region = "us-east-1"
  }
}