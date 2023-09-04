resource "aws_subnet" "PUB" {
  vpc_id     = aws_vpc.MYVPC1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "PUB"
  }
}

resource "aws_subnet" "PRAT" {
  vpc_id     = aws_vpc.MYVPC1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "PRAT"
  }
}