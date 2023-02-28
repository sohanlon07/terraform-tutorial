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

terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-sohan-gm"
    key    = "stage/datastores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks-gm"
    encrypt        = true
  }
}

module "mysql_primary_staging" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/data-stores/mysql?ref=v0.0.17"

  providers = {
    aws = aws.primary
  }

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  #must be enabled to support replication
  backup_retention_period = 0
}