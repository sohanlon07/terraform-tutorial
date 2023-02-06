provider "aws" {
    region = "us-east-2"
}

module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster" 

    cluster_name = "webservers-prod"
    db_remote_state_bucket = "terraform-state-file-storage-sohan"
    db_remote_state_key = "prod/datastores/mysql/terraform.tfstate"

    instance_type = "t2.micro"
    min_size = 2
    max_size = 3
}