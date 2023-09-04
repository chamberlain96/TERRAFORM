resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.elasticip.id
  connectivity_type = "public"
  subnet_id     = aws_subnet.PUB.id

 tags = {
    Name = "NAT_GW"
 }
}

