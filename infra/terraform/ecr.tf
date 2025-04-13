resource "aws_ecr_repository" "devexhiringtest" {
  name                 = "devexhiringtest-cmardonesp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}