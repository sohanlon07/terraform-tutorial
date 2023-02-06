variable "server_port" {
    description = "The port the server will use for http requests"
    type = number
    default = 8080 
}

variable "cluster_name" {
    description = "The name to use for all the cluster resources"  
    type = string
}

variable "db_remote_state_bucket" {
    description = "The name of the S3 bucket for the database's remote state"  
    type = string
}

variable "db_remote_state_key" {
    description = "The name to use for all the cluster resources"  
    type = string
}

variable "instance_type" {
    description = "EC2 Type"
    type = string  
}

variable "min_size" {
    description = "Min number of instances"
    type = number  
}

variable "max_size" {
    description = "Max number of instances"
    type = number  
}