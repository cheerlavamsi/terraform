terraform {
  backend "s3" {
    bucket = "d42-student"
    key    = "terraform-remote-states/proj-01/prod/terraform.tfstate"
    region = "us-east-1"
  }
}
