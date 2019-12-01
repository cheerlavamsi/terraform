variable "Sample" {
    default = 10
  }
resource "null_resource" "Sample" {
  
  provisioner "local-exec"{
      command="echo ${var.Sample}"
  }
}
