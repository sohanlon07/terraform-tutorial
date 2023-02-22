provider "aws" {
  region = "us-east-2"
}

module "eks_cluster" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/services/eks-cluster?ref=main"

  name         = "example-eks-cluster"
  min_size     = 1
  max_size     = 2
  desired_size = 1

  # EKS only works with t3.small minimum
  instance_types = ["t3.small"]
}

provider "kubernetes" {
  host = module.eks_cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(
    module.eks_cluster.cluster_certificate_authority[0].data
  )
  token = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.cluster_name
}

module "simple_webapp" {
  source = "git::https://gitlab.com/sohanlon07/terraform-tutorial-modules.git//modules/services/k8s-app?ref=main"

  name           = "simple-webapp"
  image          = "training/webapp"
  replicas       = 2
  container_port = 5000

  environment_variables = {
    PROVIDER = "Terraform"
  }

  # Only deploy the app after cluster has been deployed
  depends_on = [module.eks_cluster]
}