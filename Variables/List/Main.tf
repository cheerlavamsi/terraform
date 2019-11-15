variable "Sample" {
    type = "list"
    default = ["Vamsi", "Samalya"]
  }
resource "null_resource" "SaPmple" {
  
  provisioner "local-exec"{
      command="echo ${var.Sample[0]}"
  }
}
