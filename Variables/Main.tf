variable "Sample" {
    default = "hello-world"
  }
resource "null" "Sample" {
  
  provisioner "local-exec"{
      command="echo${var.Sample}"
  }
}
