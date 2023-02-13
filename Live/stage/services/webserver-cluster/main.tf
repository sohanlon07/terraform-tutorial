provider "aws" {
    region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-sohan"
    key  = "stage/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-state-file-storage-sohan-locks"
    encrypt = true
  }
}

module "webserver_cluster" {
    source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/services/webserver-cluster?ref=main"

    cluster_name = "webservers-stage"
    db_remote_state_bucket = "terraform-state-file-storage-sohan"
    db_remote_state_key = "stage/datastores/mysql/terraform.tfstate"

    instance_type = "t2.micro"
    min_size = 2
    max_size = 2
    enable_autoscaling = false

    # custom_tags {
    #   Owner = "team-foo"
    #   ManagedBy = "terraform"
    # }
}

resource "aws_security_group_rule" "allow_testing_inbound" {
    type = "ingress"
    security_group_id = module.webserver_cluster.alb_security_group_id

    from_port = 12345
    to_port = 12345
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}