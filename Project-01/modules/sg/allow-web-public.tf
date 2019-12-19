resource "aws_security_group" "allow-web-public" {
  name        = "allow_web_public"
  description = "Allow WEB Access for PUBLIC"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 80
    to_port     = 80
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

output "SG_WEB_PUB" {
  value = aws_security_group.allow-web-public.id
}
