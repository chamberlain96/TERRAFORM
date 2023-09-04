resource "aws_route_table" "PUBRT" {
  vpc_id = aws_vpc.MYVPC1.id

    tags = {
        Name = "PUBRT"
    }
  
}

resource "aws_route_table" "PRATRT" {
  vpc_id = aws_vpc.MYVPC1.id

    tags = {
        Name = "PRATRT"
    }
}