data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "ade-terraform-bucket-state-2699"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_eks_cluster" "eks-cluster" {
  name = "${local.name}-${var.eks_cluster_name}"

#   access_config {
#     authentication_mode = "API"
#   }

  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_cluster_version

  #This will be created in the public subnet
  vpc_config {
    subnet_ids              = data.terraform_remote_state.vpc.outputs.public_subnet_ids #public subnet should be used in this
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }



  kubernetes_network_config {
    service_ipv4_cidr = "172.20.0.0/16"
  }

   lifecycle {
    prevent_destroy = true
  }


  # enable EKS Cluster Control Plane Logging
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceController,
  ]
}

