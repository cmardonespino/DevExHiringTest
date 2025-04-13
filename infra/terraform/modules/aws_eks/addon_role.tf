locals {
  oidc_issuer_url   = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
  oidc_provider_id  = replace(local.oidc_issuer_url, "https://", "")
  oidc_provider_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_provider_id}"

}

resource "aws_iam_role" "vpc_cni_addon" {
  name = "eks-${var.eks_cluster_name}-addon-vpc-cni"
  assume_role_policy = jsonencode(
    {
      Version = "2008-10-17"
      Statement = [
        {
          Action = "sts:AssumeRoleWithWebIdentity"
          Effect = "Allow"
          Condition = {
            StringEquals = {
              "${replace(aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")}:aud" = "sts.amazonaws.com"
              "${replace(aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")}:sub" = "system:serviceaccount:kube-system:aws-node"
            }
          }
          Principal = {
            Federated = local.oidc_provider_arn
          }
        }
      ]
    }
  )

  tags = {
    Name = "${var.eks_cluster_name}-addon-vpc-cni"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.vpc_cni_addon.name
}

resource "null_resource" "thumbprint" {
  provisioner "local-exec" {
    command = <<EOT
      eksctl utils associate-iam-oidc-provider --cluster ${aws_eks_cluster.cluster.name} --approve --region ${data.aws_region.current.name} --profile ${var.aws_profile}
    EOT
  }
}