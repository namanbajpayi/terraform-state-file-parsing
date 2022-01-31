# #  Create Custom Route Table

resource "aws_route_table" "project-ig-route-table" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-igw.id
  }

  tags = {
    Name = "project-ig-routetable"
  }
}

resource "aws_route_table" "project-nat-route-table" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.project-ngw.id
  }

  tags = {
    Name = "project-nat-routetable"
  }
}