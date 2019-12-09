locals {
  tag = lower("${var.tags["project_name"]}-${var.tags["env"]}")
}
