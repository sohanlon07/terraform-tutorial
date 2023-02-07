output "public_ip" {
    value = aws_lb.example.dns_name
    description = "The domain name of the load balancer"
}

output "asg_name" {
    value = aws_autoscaling_group.example.name
    description = "The name of the Auto Scaling Group"
}

output "alb_dns_name" {
    value = module.webserver_cluster.alb_dns_name
    ddescription = "The domain name of the load balancer"  
}