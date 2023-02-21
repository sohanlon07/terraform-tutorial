output "alb_dns_name" {
  value = module.hello_word_app.alb_dns_name
  description = "The domain name of the load balancer"
}