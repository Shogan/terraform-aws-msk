terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = "your-region"
}

module "msk" {
  source                  = "git::https://github.com/Shogan/terraform-aws-msk.git?ref=master"
  namespace               = "eg"
  stage                   = "dev"
  name                    = "msk"
  security_groups         = ["sg-xxxxxxxxxxx"]
  subnet_ids              = ["subnet-aaaaaaaa", "subnet-bbbbbbbb", "subnet-ccccccccc"]
}
