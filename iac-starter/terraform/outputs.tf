output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "rds_hostname" {
  value = aws_db_instance.main.address
}

output "vpc_id" {
  value = aws_vpc.main.id
}
