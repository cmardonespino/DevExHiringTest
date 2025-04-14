resource "aws_route" "private1_nat" {
  route_table_id         = "rtb-07077cb2a79399184" # us-east-1a
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public["subnet-078d52137a1bb1f5b"].id
}

resource "aws_route" "private2_nat" {
  route_table_id         = "rtb-0b3ea345e55d6325d" # us-east-1b
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public["subnet-01194fe25bf73b571"].id
}