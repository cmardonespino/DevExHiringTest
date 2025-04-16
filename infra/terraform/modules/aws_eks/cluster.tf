resource "aws_eks_cluster" "cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.cluster.arn

  bootstrap_self_managed_addons = false

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]

  vpc_config {
    subnet_ids = var.eks_cluster_subnet_ids

    endpoint_private_access = true
    endpoint_public_access  = false
  }

  version = var.eks_cluster_version

  tags = {
    Name = var.eks_cluster_name
  }
}