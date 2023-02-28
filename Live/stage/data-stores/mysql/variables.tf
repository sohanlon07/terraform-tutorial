variable "db_username" {
  description = "the username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Name to use for the database"
  type        = string
  default     = "example_database_stage"
}