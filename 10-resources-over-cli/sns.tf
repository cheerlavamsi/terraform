resource "null_resource" "create-sns" {
    provisioner "local-exec"{
        command     =   "aws sns create-topic --name sample"
    }
  
}
