# #  Create a Public Subnet 

resource "aws_subnet" "subnet-pub" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "project-pub-subnet"
  }
}

# #  Create a Private Subnet 

resource "aws_subnet" "subnet-priv" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "project-priv-subnet"
  }
}