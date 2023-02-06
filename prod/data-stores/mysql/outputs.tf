output "address" {
    value = aws_db_instance.name.address
    description = "Connecto the database at this endpoint"
}

output "port" {
    value = aws_db_instance.name.port
    description = "The port the db is listening on"
}