variable "Sample" {
    default = true
  }
resource "null_resource" "SaPmple" {
  
  provisioner "local-exec"{
      command="echo ${var.Sample}"
  }
}
