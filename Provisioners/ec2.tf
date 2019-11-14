resource "aws_instance" "web"{
    ami ="ami-02383135f96b2293e"
    instance_type = "t2.micro"
    
    provisioner "remote-exec" {
        connection{
            type        ="ssh"
            user        ="root"
            password    ="DevOps321"
            host        = self.public_ip
        }
    }

}
