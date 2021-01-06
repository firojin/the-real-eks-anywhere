output "cluster_name" {
  value = aws_eks_cluster.cluster.id
}

output "endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

output "security_group_id" {
  value = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}
