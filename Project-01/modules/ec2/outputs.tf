output "SERVER_FOR_SCHEMA" {
  value = aws_instance.web.public_ip
}

output "SERVER_ID" {
  value = aws_instance.web.id
}

