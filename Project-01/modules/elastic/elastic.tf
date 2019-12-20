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

}
