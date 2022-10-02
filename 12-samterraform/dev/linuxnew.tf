provider "aws" {
      region = "us-east-1"
}

resource "aws_instance" "testvm" {
  ami           = var.ami
  instance_type = var.instance_type

  tags    = {
    Name  = "VM1"
    } 
	
  credit_specification {
    cpu_credits = "unlimited"
  }
}
