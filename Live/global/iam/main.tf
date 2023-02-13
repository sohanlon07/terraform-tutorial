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
    bucket = "terraform-state-file-storage-sohan"
    key  = "global/landing-zone/iam-user/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks"
    encrypt = true
  }
}

resource "aws_iam_user" "example" {    
    for_each = toset(var.user_names)
    name = each.value
}