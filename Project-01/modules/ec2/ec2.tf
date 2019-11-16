resource "aws_instance" "web" {
    ami             = var.ami
    instance_type   = var.instance_type
    tags            = {
    
        Name        = "${var.tags["Project_Name"]}-${var.tags["env"]}"
    } 

provisioner "remote-exec"{
        connection {

                type        ="ssh"
                user        ="root"
                password    ="DevOps321"
                host        = self.public_ip
        }
        inline = [

            "cd/temp",
            "git clone https://github.com/cheerlavamsi/Shell_Scripts.git",
            "sh /root/Shell_Scripts/MonolithicServices/webapp.sh ${var.RDS_USERNAME} ${var.RDS_PASSWORD} ${var.RDS_DBNAME} ${var.RDS_ENDPOINT}",
        ]
    }
}