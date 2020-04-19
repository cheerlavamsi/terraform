resource "aws_instance" "web"{
    ami ="ami-0ae75460021c23d13"
    instance_type = "t2.micro" 

    tags  = {
      Name  = "Sample Instance"
    }
  }