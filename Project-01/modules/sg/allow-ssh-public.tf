resource "aws_security_group" "allow-ssh-public" {
  name        = "allow_ssh_public"
  description = "Allow SSH Access for PUBLIC"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

output "SG_SSH_PUB" {
  value = aws_security_group.allow-ssh-public.id
}
