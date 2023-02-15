provider "aws" {
  region = "us-east-2" 

  #Tags to applly to all reosurces by default
  default_tags {
    tags = {
      Owner = "team-sohan"
      ManagedBy = "Terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-sohan-gm"
    key  = "stage/datastores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks-gm"
    encrypt = true
  }
}

resource "aws_db_instance" "name" {
    identifier_prefix = "terraform-up-and-running"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    skip_final_snapshot = true
    db_name = "example_database"

    username = var.db_username
    password = var.db_username
  
}