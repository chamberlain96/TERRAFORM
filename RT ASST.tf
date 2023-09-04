resource "aws_route_table_association" "ass_sn" {
  subnet_id      = aws_subnet.PUB.id
  route_table_id = aws_route_table.PUBRT.id
}
resource "aws_route" "ass_igw" {
  route_table_id = aws_route_table.PUBRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.IGW1.id
  
}

resource "aws_route" "private_subnet_nat_route" {
  route_table_id         = aws_route_table.PRATRT.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NAT_GW.id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.PRAT.id
  route_table_id = aws_route_table.PRATRT.id
}