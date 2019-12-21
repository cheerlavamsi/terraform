resource "aws_instance" "logstash" {
  count                             = 1
  ami                               = var.ami
  instance_type                     = "t2.medium"
  vpc_security_group_ids            = [ var.SG_WEB_PUB, var.SG_SSH_PUB, var.SG_LS_INT ]
  subnet_id                         = element(var.PUBLIC_SUBNETS, count.index)
  key_name                          = "devops"
  tags                              = {
    Name                            = "${var.tags["project_name"]}-logstash"
  }

provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = var.SSH_USER
      private_key   = file(var.SSH_KEY)
      host          = self.public_ip
    }

    inline = [
      "cd /tmp",
      "sudo yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://github.com/cheerlavamsi/ansible.git Projects/Studentapp/logstash.yml -e ES_URL=${aws_elasticsearch_domain.domain.endpoint}"
    ]
  }

}
