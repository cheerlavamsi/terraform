resource "aws_security_group" "allow-rds-internal" {
  name        = "allow_rds_internal"
  description = "Allow RDS Internal Access for VPC"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 3306
    to_port     = 3306
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

output "SG_RDS_MYSQL_INT" {
  value = aws_security_group.allow-rds-internal.id
}
