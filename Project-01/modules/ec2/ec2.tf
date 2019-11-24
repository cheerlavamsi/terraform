resource "aws_instance" "web" {
    ami                     = var.ami
    instance_type           = var.instance_type
    vpc_security_group_ids  = ["sg-09734e0ae6147a09b","sg-098fd4a5ffc0e66b6"]
    tags                    = {
            Name            = "${var.tags["Project_Name"]}-${var.tags["env"]}"
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
            "yum install ansible -y",
            "echo localhost >/tmp/hosts",
            "ansible-pull -i /tmp/hosts -U https://github.com/cheerlavamsi/ansible.git Projects/Studentapp/Webapp.yml -e DBUSER=${var.RDS_USERNAME} -e DBPASS=${var.RDS_PASSWORD} -e DBHOST=${var.RDS_ENDPOINT} -e DBNAME=${var.RDS_DBNAME}",
        ]
    }
}