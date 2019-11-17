variable "sample" {
  type    = "list"
  default = ["vamsi", "samalya"]
}

resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo ${var.sample[0]}"
  }
}
