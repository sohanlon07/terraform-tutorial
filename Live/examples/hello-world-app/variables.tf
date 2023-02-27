variable "mysql_config" {
  description = "The config for mysql db"

  type = object({
    address = string
    port = number
  })

  default = {
    address = "mock-my-sql-address"
    port = 12345
  }
}