resource "aws_instance" "web" {
    ami ="ami-02383135f96b2293e"
    instance_type = "t2.micro"
    vpc_security_group_ids =["sg-098fd4a5ffc0e66b6","sg-09734e0ae6147a09b"]

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
            "sh /Shell_Scripts/MonolithicServices/Install.sh",
        ]
    }
}