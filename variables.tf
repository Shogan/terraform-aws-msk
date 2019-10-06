variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the application"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "custom_kms_key" {
  type        = string
  description = "A custom, pre-defined KMS key ARN ID to use for encryption at rest"
  default     = ""
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "List of security group IDs to be allowed to connect to the cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "broker_node_instance_type" {
  type        = string
  default     = "kafka.m5.large"
  description = "Kafka instance type for broker nodes"
}

variable "broker_node_instance_count" {
  type        = number
  description = "Number of broker nodes in the cluster"
  default     = 3
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volumes for data storage in GB"
  default     = 10
}
