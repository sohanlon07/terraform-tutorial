provider "kubernetes" {
    config_path = "~/.kube/config"
    config_context =   "rancher-desktop"
}

module "simple_webapp" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/services/k8s-app?ref=main"

  name = "simple-webapp"
  image = "training/webapp"
  replicas = 2
  container_port = 5000

  environment_variables = {
    PROVIDER = "Terraform"
  }
}