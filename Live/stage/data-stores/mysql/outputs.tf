output "address" {
    value = aws_db_instance.name.address
    description = "Connecto the database at this endpoint"
}

output "port" {
    value = aws_db_instance.name.port
    description = "The port the db is listening on"
}

output "alb_dns_name" {
    value = module.webserver_cluster.alb_dns_name
    description = "Doman name of the load balancer"
}