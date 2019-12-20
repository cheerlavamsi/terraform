resource "aws_elasticsearch_domain" "domain" {
    domain_name = "${lower(var.tags["project_name"])}-es"
    elasticsearch_version = "7.1"

    cluster_config {
    instance_type = "t2.small.elasticsearch"
  }

    vpc_options {
    subnet_ids = [var.PRIVATE_SUBNETS[0]]
    security_group_ids = [ var.SG_ES_INT ]
  }

    ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${lower(var.tags["project_name"])}-es/*"
        }
    ]
}
CONFIG


}
