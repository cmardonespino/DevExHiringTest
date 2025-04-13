resource "aws_eks_node_group" "nodegroup" {
  cluster_name    = var.eks_cluster_name
  node_group_name = var.eks_nodegroup_name
  node_role_arn   = aws_iam_role.nodegroup.arn
  subnet_ids      = var.eks_nodegroup_subnet_ids

  scaling_config {
    desired_size = var.scaling_config_desired_size
    max_size     = var.scaling_config_max_size
    min_size     = var.scaling_config_min_size
  }

  capacity_type = var.capacity_type

  ami_type = var.ami_type

  version = var.eks_nodegroup_version == null ? aws_eks_cluster.cluster.version : var.eks_nodegroup_version

  launch_template {
    id      = aws_launch_template.template.id
    version = aws_launch_template.template.latest_version
  }

  labels = merge(
    var.eks_nodegroup_labels,
    {
      nodegroup-name = var.eks_nodegroup_name
    }
  )

  tags = {
    Name = var.eks_nodegroup_name
  }

  depends_on = [aws_launch_template.template, aws_eks_addon.kube_proxy]
}
