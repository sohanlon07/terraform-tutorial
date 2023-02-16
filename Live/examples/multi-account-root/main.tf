provider "aws" {
    region = "us-east-2"
    alias = "parent"

   default_tags {
    tags = {
      Owner = "sohan"
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
    region = "us-east-2"
    alias = "child"

    assume_role {
      role_arn = "arn:aws:iam::953427527558:role/OrganizationAccountAccessRole"
    }

   default_tags {
    tags = {
      Owner = "sohan"
      ManagedBy = "Terraform"
    }
  }
}

data "aws_caller_identity" "parent" {
    provider = aws.parent  
}
data "aws_caller_identity" "child" {
    provider = aws.child  
}