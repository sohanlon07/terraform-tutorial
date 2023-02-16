output "primary_address" {
    value = module.mysql_primary_staging.address
    description = "Connect to the primary database at this endpoint"
}

output "primary_port" {
    value = module.mysql_primary_staging.port
    description = "The port the primary db is listening on"
}

output "primary_arn" {
    value = module.mysql_primary_staging.arn
    description = "ARN of the primary database"
}