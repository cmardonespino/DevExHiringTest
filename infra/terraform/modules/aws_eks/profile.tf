resource "aws_iam_instance_profile" "profile" {
  name = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}"
  role = aws_iam_role.nodegroup.name # role associated to the ec2 instances
}