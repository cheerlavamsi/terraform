resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "sleep 120"
  }
}

terraform {
  backend "s3" {
    bucket = "d42-student"
    key    = "terraform-remote-states/proj-01/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

