resource "aws_iam_policy" "ecr_access_policy" {
  name        = "GitHubActionsECRAccess"
  description = "Policy for GitHub Actions to access ECR"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "eks:DescribeCluster"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ecr_access" {
  role       = data.aws_iam_role.gh_actions.name
  policy_arn = aws_iam_policy.ecr_access_policy.arn
}