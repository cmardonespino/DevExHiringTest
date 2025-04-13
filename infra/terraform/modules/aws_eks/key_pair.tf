resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}-node"
  public_key = tls_private_key.pk.public_key_openssh

  tags = {
    Name          = "eks-${var.eks_cluster_name}-${var.eks_nodegroup_name}-node"
  }
}