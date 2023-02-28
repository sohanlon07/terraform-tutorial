variable "mysql_config" {
  description = "The config for mysql db"

  type = object({
    address = string
    port    = number
  })

  default = {
    address = "mock-my-sql-address"
    port    = 12345
  }
}

variable "environment" {
  description = "Name of the environment we're deploying to"
  type        = string
  default     = "example"
} 