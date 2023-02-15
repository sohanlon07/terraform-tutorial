provider "aws" {
    region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-sohan-gm"
    key  = "stage/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks-gm"
    encrypt = true
  }
}

module "webserver_cluster" {
    source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/services/webserver-cluster?ref=main"

    ami = "ami-0fb653ca2d3203ac1"
    server_text = "New Server Text STAGING"

    cluster_name = "webservers-stage"
    db_remote_state_bucket = "terraform-state-file-storage-sohan"
    db_remote_state_key = "stage/datastores/mysql/terraform.tfstate"

    instance_type = "t2.micro"
    min_size = 1
    max_size = 2
    enable_autoscaling = true
}