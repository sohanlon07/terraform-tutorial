# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_text" {
  description = "The text the web server should return"
  default     = "Hello, World"
  type        = string
}

variable "environment" {
  description = "The name of the environment we're deploying to"
  type        = string
  default     = "stage"
}

variable "db_remote_state_bucket" {
  description = "Name of S3 Bucket for DBs remote state"
  type = string
}

variable "db_remote_state_key" {
  description = "Path for DBs remote state in S3"
  type = string
}