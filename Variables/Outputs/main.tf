variable "ami" {
    default = "ami-02383135f96b2293e"
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

resource "aws_instance" "web" {
    ami = var.ami
    instance_type   = var.instance_type
     
}

output "PUBLIC_IP" {

  value =  aws_instance.web.associate_public_ip_address
}


