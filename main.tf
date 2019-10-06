module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.14.1"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_kms_key" "kms" {
  count       = var.custom_kms_key == "" ? 1 : 0
  description = "MSK - ${module.label.id}"
}

resource "aws_msk_cluster" "default" {
  cluster_name           = module.label.id
  kafka_version          = "2.2.1"
  number_of_broker_nodes = var.broker_node_instance_count

  broker_node_group_info {
    instance_type  = var.broker_node_instance_type
    ebs_volume_size = var.ebs_volume_size
    client_subnets = var.subnet_ids
    security_groups = var.security_groups
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = var.custom_kms_key == "" ? aws_kms_key.kms[0].arn : var.custom_kms_key
  }

  tags = {
    foo = "bar"
  }
}
