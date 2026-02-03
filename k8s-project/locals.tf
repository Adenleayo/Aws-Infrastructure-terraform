locals {
  owner             = "Ayomide Adenle"
  project           = "Building a vpc and ec2 instance"
  Environment       = "Development"
  name              = var.eks_cluster_name
  availability_zone = "us-east-1a"
  region            = var.aws_region

  tags = {
    Owner       = local.owner
    Environment = local.Environment
  }
}


