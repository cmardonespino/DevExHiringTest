resource "aws_eip" "nat" {
  for_each = {
    for subnet_id in data.aws_subnets.public.ids :
    subnet_id => subnet_id
  }
  vpc = true
}

resource "aws_nat_gateway" "public" {
  for_each          = aws_eip.nat
  allocation_id     = each.value.id
  subnet_id         = each.key
  connectivity_type = "public"

  tags = {
    Name = "natgw-${each.key}"
  }
}