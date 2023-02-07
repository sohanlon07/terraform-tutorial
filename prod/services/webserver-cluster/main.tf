provider "aws" {
    region = "us-east-2"
}

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
    source = "../../../modules/services/webserver-cluster" 

    cluster_name = "webservers-prod"
    db_remote_state_bucket = "terraform-state-file-storage-sohan"
    db_remote_state_key = "prod/datastores/mysql/terraform.tfstate"

    instance_type = "t2.micro"
    min_size = 2
    max_size = 3
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
    scheduled_action_name = "scale_out_during_business_hours"
    min_size = 2
    max_size = 10
    desired_capacity = 10
    recurrence = "0 9 * * *"

    autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
    scheduled_action_name = "scale_in_at_night"
    min_size = 2
    max_size = 10
    desired_capacity = 2
    recurrence = "0 17 * * *"
 
    autoscaling_group_name = module.webserver_cluster.asg_name 
}