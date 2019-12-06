resource "null_resource" "create-email-subscription" {
  provisioner "local-exec" {
    command = "aws sns subcribe --topic-arn ${aws_sns_topic.monitoring-emails-notify.arn} --protocol email --notification-endpoint "
  }

  provisioner "local-exec" {
    when = "destroy"
    command = "aws sns delete-topic --topic-arn arn:aws:sns:us-east-1:130241414257:sample"
  }
}