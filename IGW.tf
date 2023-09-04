resource "aws_internet_gateway" "IGW1" {
  vpc_id = aws_vpc.MYVPC1.id

  tags = {
    Name = "IGW1"
  }
}