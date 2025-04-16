resource "aws_iam_role" "nodegroup" {
  name        = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}-node-instance"
  description = "Role for ${var.eks_nodegroup_name} nodegroup"

  assume_role_policy = data.aws_iam_policy_document.nodegroup.json

  managed_policy_arns = concat([
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AutoScalingFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/service-role/AWSAppSyncPushToCloudWatchLogs"
    ],
    var.node_ssm_connection ? ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"] : []
  )

  force_detach_policies = false

  tags = {
    Name = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}-node-instance"
  }
}

data "aws_iam_policy_document" "nodegroup" {
  statement {
    sid     = "EKSNodeAssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}