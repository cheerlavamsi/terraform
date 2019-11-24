data "aws_s3_bucket_object" "schema-file" {
  //provider = aws
  bucket            = "d42-student"
  key               = "studentapp-ui-rds.sql"
}

resource "local_file" "schema-file" {
  content           = data.aws_s3_bucket_object.schema-file.body
  filename          = "/tmp/schema.sql"
}

resource "null_resource" "schema" {

  provisioner "local-exe" {
    command = <<EOF
        sudo yum install mariadb -y
        mysql -h ${aws_db_instance.default.addres} -u${var.RDS_USERNAME} -p${var.RDS_PASSWORD} </tmp/schema.sql
EOF
  }
}