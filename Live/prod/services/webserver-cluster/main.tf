terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-sohan"
    key  = "prod/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks"
    encrypt = true
  }

}

module "webserver_cluster" {
    source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/services/webserver-cluster?ref=main" 

    cluster_name = "webservers-prod"
    db_remote_state_bucket = "terraform-state-file-storage-sohan"
    db_remote_state_key = "prod/datastores/mysql/terraform.tfstate"

    instance_type = "t2.micro"
    min_size = 2
    max_size = 3
    enable_autoscaling = true

    tags {
       Owner = "team-foo"
       ManagedBy = "terraform"
    }
}