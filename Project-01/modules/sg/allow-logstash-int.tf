resource "aws_security_group" "allow-logstash-int" {
  name        = "allow_logstash_int"
  description = "Allow Logstash for INTERNAL"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 5044
    to_port     = 5044
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

output "SG_LS_INT" {
  value = aws_security_group.allow-logstash-int.id
}
