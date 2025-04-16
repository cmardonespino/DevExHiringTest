resource "aws_eks_addon" "kube_proxy" {
  cluster_name                = aws_eks_cluster.cluster.name
  addon_name                  = "kube-proxy"
  addon_version               = var.addon_kube_proxy_version
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [aws_eks_cluster.cluster]
}

resource "aws_eks_addon" "code_dns" {
  cluster_name                = aws_eks_cluster.cluster.name
  addon_name                  = "coredns"
  addon_version               = var.addon_code_dns_version
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [aws_eks_cluster.cluster, null_resource.thumbprint, aws_eks_node_group.nodegroup]
}

resource "aws_eks_addon" "cni" {
  cluster_name                = aws_eks_cluster.cluster.name
  service_account_role_arn    = aws_iam_role.vpc_cni_addon.arn
  addon_name                  = "vpc-cni"
  addon_version               = var.addon_cni_version
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [aws_eks_cluster.cluster, null_resource.thumbprint]
}
