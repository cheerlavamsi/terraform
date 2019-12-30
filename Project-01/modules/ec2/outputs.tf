output "SERVER_FOR_SCHEMA" {
  value = "na"
}

output "SERVER_ID" {
  value = aws_instance.web.*.id
}

