resource "aws_instance" "web" {
  count                             = var.INSTANCE_COUNT
  ami                               = var.ami
  instance_type                     = var.instance_type
  vpc_security_group_ids            = [ var.SG_WEB_PUB, var.SG_SSH_PUB ]
  subnet_id                         = element(var.PUBLIC_SUBNETS, count.index)
  iam_instance_profile              = var.EC2-INSTANCE-PROFILE
  key_name                          = "Devops"
  tags                              = {
    Name                            = "${var.tags["project_name"]}-${var.tags["env"]}"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.SSH_USER
      //password  = "DevOps321"
      private_key = file(var.SSH_KEY)
      host         = self.public_ip
    }

    inline = [
      "cd /tmp",
      "sudo yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "echo ${var.VAULT_PASS} > /home/centos/.vault",
      "ansible-pull -i /tmp/hosts -U https://github.com/cheerlavamsi/ansible.git Projects/Studentapp/Webapp.yml -e DBUSER=${var.RDS_USERNAME} -e DBPASS=${var.RDS_PASSWORD} -e DBHOST=${var.RDS_ENDPOINT} -e DBNAME=${var.RDS_DBNAME} -e AWS_REGION=${var.AWS_REGION} --vault-password-file /home/centos/.vault"
    ]
  }

}
