provider "aws" {
    region = "us-east-2"
  
}

module "users" {
    source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/landing-zone/iam-user?ref=main"
    
    for_each = toset(var.user_names)
    user_name = each.value
}