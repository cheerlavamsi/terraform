resource "aws_security_group" "allow-es-int" {
  name        = "allow_es_int"
  description = "Allow ES Access for INTERNAL"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.VPC_CIDR]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

output "SG_ES_INT" {
  value = aws_security_group.allow-es-int.id
}
 