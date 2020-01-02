terraform {
  backend "s3" {
    bucket = "d42-student"
    key    = "terraform-remote-states/prod-route53/terraform.tfstate"
    region = "us-east-1"
  }
}
