variable "Sample" {
    type = "map"
    default = {

      Course_Name = "Devops"
      Attender  = "Samalya Reddy"
      Timings = "6 AM IST"

    }
  }
resource "null_resource" "Sample" {
  
  provisioner "local-exec"{
      command="echo welcome to ${var.Sample["Course_Name"]} training, Timings is ${var.Sample["Timings"]} and Attender is ${var.Sample["Attender"]}"
  }
}
