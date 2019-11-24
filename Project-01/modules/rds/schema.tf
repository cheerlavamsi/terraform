data "aws_s3_bucket_object" "schema-file" {
  //provider = aws
  bucket            = "d42-resources"
  key               = "studentapp-ui-rds.sql"
}

resource "local_file" "schema-file" {
  content           = data.aws_s3_bucket_object.schema-file.body
  filename          = "/tmp/schema.sql"
}

resource "null_resource" "schema" {

  provisioner "file" {
    connection {
      type          = "ssh"
      user          = "root"
      password      = "DevOps321"
      host          = var.SERVER_FOR_SCHEMA
    }
    source          = local_file.schema-file.filename
    destination     = "/tmp/schema.sql"
  }

  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = "root"
      password      = "DevOps321"
      host          = var.SERVER_FOR_SCHEMA
    }

    inline = [
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://rkb03:password@gitlab.com/dops42/ansible.git projects/studentapp/schema.yml -e DBUSER=${var.RDS_USERNAME} -e DBPASS=${var.RDS_PASSWORD} -e DBHOST=${aws_db_instance.default.address}"
    ]
  }
}