resource "null_resource" "create-sns" {
  provisioner "local-exec" {
    command = "aws sns create-topic --name sample"
  }

  provisioner "local-exec" {
    when = "destroy"
    command = "aws sns delete-topic --topic-arn arn:aws:sns:us-east-1:130241414257:sample"
  }
}

