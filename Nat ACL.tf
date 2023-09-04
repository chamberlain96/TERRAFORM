resource "aws_network_acl" "NACL" {
  vpc_id = aws_vpc.MYVPC1.id
  tags = {
    Name = "NACL"
  }
}

# Inbound rule example (allow SSH)
resource "aws_network_acl_rule" "inbound_ssh" {
  rule_number   = 100
  network_acl_id = aws_network_acl.NACL.id
  protocol      = "6"   # TCP protocol
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 22
  to_port       = 22
  egress        = false
}

# Outbound rule example (allow all outbound traffic)
resource "aws_network_acl_rule" "outbound_allow_all" {
  rule_number   = 200
  network_acl_id = aws_network_acl.NACL.id
  protocol      = "-1"  # All protocols
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  egress        = true
}


resource "aws_network_acl_association" "Nat_ass" {
  network_acl_id = aws_network_acl.NACL.id
  subnet_id      = aws_subnet.PUB.id
}


resource "aws_network_acl_association" "Nat_ass_prat" {
  network_acl_id = aws_network_acl.NACL.id
  subnet_id      = aws_subnet.PRAT.id
}
