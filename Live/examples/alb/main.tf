terraform {
  required_version = ">=1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "alb" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/networking/alb?ref=v0.0.20"

  alb_name   = var.alb_name
  subnet_ids = data.aws_subnets.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}