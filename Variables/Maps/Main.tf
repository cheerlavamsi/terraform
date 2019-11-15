variable "Sample" {
    type = "map"
    default = {

      Course_Name = "Devops"
      Attender  = "Samalya Reddy"
      Timings = "6 AM IST"

    }
  }
resource "null_resource" "SaPmple" {
  
  provisioner "local-exec"{
      command="echo welcome to ${var.Sample["Course_Name"]} training, training is ${var.Sample["Timings"]} and Attander is ${var.Sample["Attander"]}"
  }
}
