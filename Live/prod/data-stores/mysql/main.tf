provider "aws" {
  region = "us-east-2"
  alias  = "primary"

  #Tags to applly to all reosurces by default
  default_tags {
    tags = {
      Owner     = "team-sohan"
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
  region = "us-west-1"
  alias  = "replica"

  #Tags to applly to all reosurces by default
  # default_tags {
  #   tags = {
  #     Owner = "team-sohan"
  #     ManagedBy = "Terraform"
  #   }
  # }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-sohan-gm"
    key    = "prod/datastores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks-gm"
    encrypt        = true
  }
}

module "mysql_primary" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/data-stores/mysql?ref=main"

  providers = {
    aws = aws.primary
  }

  db_name     = "prod_db"
  db_username = var.db_username
  db_password = var.db_password

  #must be enabled to support replication
  backup_retention_period = 1
}

module "mysql_replica" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/data-stores/mysql?ref=main"

  providers = {
    aws = aws.replica
  }

  # Make this a replica of the primary
  replicate_source_db = module.mysql_primary.arn
}