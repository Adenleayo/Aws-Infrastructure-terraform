output "eks-role-arn" {
  description = "The ARN of the EKS Cluster Role"
  value       = aws_iam_role.eks_cluster_role.arn
  #aws_iam_role" "eks_cluster_rol
}

#aws_eks_cluster" "eks-cluster
output "eks-cluster-endpoint" {
  description = "The endpoint for the EKS Cluster"
  value       = aws_eks_cluster.eks-cluster.endpoint
}

output "eks-cluster-ca" {
  description = "The certificate authority data for the EKS Cluster"
  value       = aws_eks_cluster.eks-cluster.certificate_authority[0].data
  sensitive   = true
}

output "eks-cluster-name" {
  description = "The name of the EKS Cluster"
  value       = aws_eks_cluster.eks-cluster.id
}