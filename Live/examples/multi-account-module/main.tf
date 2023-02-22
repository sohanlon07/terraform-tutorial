provider "aws" {
  region = "us-east-2"
  alias  = "parent"
}

provider "aws" {
  region = "us-east-2"
  alias  = "child"

  assume_role {
    role_arn = "arn:aws:iam::953427527558:role/OrganizationAccountAccessRole"
  }
}

module "multi_account_example" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/examples/multi-account-root?ref=main"

  providers = {
    aws.parent = aws.parent
    aws.child  = aws.child
  }
}