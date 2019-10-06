# terraform-aws-msk

A Terraform module to provision an [Amazon MSK cluster](https://aws.amazon.com/msk/) (Amazon Managed Streaming for Apache Kafka).

Right now the module is very basic, but will be extended in the near future.

## Usage

Basic [example](example/basic)

```hcl
terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = eu-west-2
}

module "msk" {
  source                     = "git::https://github.com/Shogan/terraform-aws-msk.git?ref=master"
  namespace                  = "eg"
  stage                      = "dev"
  name                       = "msk"
  security_groups            = ["sg-xxxxxxxxxxx"]
  subnet_ids                 = ["subnet-aaaaaaaa", "subnet-bbbbbbbb", "subnet-ccccccccc"]
  broker_node_instance_type  = "kafka.m5.large"
  broker_node_instance_count = 3
}
```
