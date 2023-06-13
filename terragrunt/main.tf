provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"  # Update with your desired region
}

resource "tls_private_key" "pvkey" {
  algorithm = "RSA"
  rsa_bits  = 2048
   
}

resource "aws_security_group" "ssh" {
  name        = "ssh-security-group"
  description = "Security group for SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-053b0d53c279acc90"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name = tls_private_key.pvkey.id

  tags = {
    Name = "Dev_Test"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",  # Update system packages
      "sudo amazon-linux-extras install docker -y",  # Install Docker
      "sudo systemctl start docker",  # Start Docker service
      "sudo usermod -aG docker ec2-user"  # Add the ec2-user to the Docker group
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("mykey")  # Replace with the path to your private key file
    host        = self.public_ip
  }
}
