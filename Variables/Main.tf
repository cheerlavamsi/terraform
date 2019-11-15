variable "Sample" {
    default = "hello-world"
  }
resource "null_resource" "Sample" {
  
  provisioner "local-exec"{
      command="echo${var.Sample}"
  }
}
