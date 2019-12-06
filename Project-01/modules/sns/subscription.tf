resource "null_resource" "create-email-subscription" {
    count   =   length(var.SNS_SUBSCRIPTION_EMAIL)

  provisioner "local-exec" {
    command = "aws sns subcribe --topic-arn ${aws_sns_topic.monitoring-emails-notify.arn} --protocol email --notification-endpoint ${element(var.SNS_SUBSCRIPTION_EMAIL, count.index)}"
  }

  provisioner "local-exec" {
    when = "destroy"
    command = "aws sns unsubscribe --subscription-arn"
  }
}