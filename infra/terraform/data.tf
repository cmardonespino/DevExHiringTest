data "aws_vpc" "devexhiringtest" {
  filter {
    name   = "tag:Name"
    values = ["ws-test-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["ws-test-subnet-private*-us-east-1*"]
  }
}

data "aws_subnet" "private" {
  for_each = { for id in data.aws_subnets.private.ids : id => id }
  id       = each.key
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["ws-test-subnet-public*-us-east-1*"]
  }
}

data "aws_subnet" "public" {
  for_each = { for id in data.aws_subnets.public.ids : id => id }
  id       = each.key
}