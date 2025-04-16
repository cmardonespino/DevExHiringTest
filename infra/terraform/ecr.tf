resource "aws_ecr_repository" "devexhiringtest" {
  name                 = "devexhiringtest-cmardonesp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_lifecycle_policy" "devexhiringtest" {
  repository = aws_ecr_repository.devexhiringtest.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Eliminar imagenes sin tag"
        selection = {
          tagStatus     = "untagged"
          countType     = "sinceImagePushed"
          countUnit     = "days"
          countNumber   = 1
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Mantener solo las ultimas 5 imagenes con tag"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["build-", "test-"]
          countType     = "imageCountMoreThan"
          countNumber   = 5
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
