resource "aws_instance" "public_Instance" {
  ami           = "ami-051f7e7f6c2f40dc1"  
  instance_type = "t2.micro"
  count = "2"  
  subnet_id     = aws_subnet.PUB.id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.PUB_SG.id]
  tags = {
    Name = "PUB_Instance"
  }
}

resource "aws_instance" "private_Instance" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  count = "2"
  subnet_id     = aws_subnet.PRAT.id
  vpc_security_group_ids = [aws_security_group.PRAT_SG.id]
  tags = {
    Name = "PRAT_Instance"
  }
}