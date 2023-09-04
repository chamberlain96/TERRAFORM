
resource "aws_security_group" "PUB_SG" {
  name_prefix = "public-"
  vpc_id      = aws_vpc.MYVPC1.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PUB_SG" 
  }
}

resource "aws_security_group" "PRAT_SG" {
  name_prefix = "private-"
  vpc_id      = aws_vpc.MYVPC1.id
   
   
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["10.0.0.0/16"]
  }
   
   tags = {
    Name = "PRAT_SG"
  }
}