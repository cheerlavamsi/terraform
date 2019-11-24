provider "aws" {
  alias  = "N. Virginia"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "d42-resources"
    key    = "terraform-remote-states/proj-01/terraform.tfstate"
    region = "us-east-1"
  }
}
