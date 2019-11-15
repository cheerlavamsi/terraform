variable "Sample" {
    default = true
  }
resource "null_resource" "Sample" {
  
  provisioner "local-exec"{
      command="echo ${var.Sample}"
  }
}
