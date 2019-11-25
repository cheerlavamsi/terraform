resource "aws_instance" "web" {
  ami                               = var.ami
  instance_type                     = var.instance_type
  #vpc_security_group_ids            = [ var.SG_WEB_PUB, var.SG_SSH_PUB ]
  tags                              = {
    Name                            = "${var.tags["project_name"]}-${var.tags["env"]}"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = "DevOps321"
      host     = self.public_ip
    }

    inline = [
      "cd /tmp",
      "yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://github.com/cheerlavamsi/ansible.git Projects/Studentapp/Webapp.yml -e DBUSER=${var.RDS_USERNAME} -e DBPASS=${var.RDS_PASSWORD} -e DBHOST=${var.RDS_ENDPOINT} -e DBNAME=${var.RDS_DBNAME}"
    ]
  }

}
