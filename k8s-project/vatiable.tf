variable "eks_cluster_name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "ade-eks-demo"
}

variable "aws_region" {
  description = "eks cluster for aws region"
  type        = string
  default     = "us-east-1"
}


variable "bucket_name" {
  description = "The name of the S3 bucket for EKS state storage"
  type        = string
  default     = "ade-terraform-bucket-state-2699"
}

variable "ssh_key_folder" {
  description = "The folder in the S3 bucket where SSH keys are stored for eks"
  type        = string
  default     = "eks_ssh_folder"
}

variable "eks_port_number" {
  description = "The port numbers to be opened for EKS cluster"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "eks_cluster_version" {
  description = "The Kubernetes version for the EKS Cluster"
  type        = string
  default     = "1.34"
}
variable "eks_cluster_role_name" {
  description = "The name of the EKS Cluster Role"
  type        = string
  default     = "ade-eks-cluster-role"
}

# variable "aws_region" {
#   description = "The AWS region to deploy resources"
#   type        = string
#   default     = "us-east-1"
# }

variable "cluser_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.27"
}

# variable "cluster_name" {
#   description = "EKS cluster name"
#   type        = string
#   default     = "eks-cluster"
# }

variable "cluster_service_ipv4_cidr" {
  description = "EKS cluster service IPv4 CIDR"
  type        = string
  default     = null
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to the EKS cluster endpoint"
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDRs that can access the EKS cluster endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# variable "eks_oidc_thumbprint" {
#   description = "EKS cluster oicd thumbprint"
#   type        = string
# }