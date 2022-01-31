# # Create Internet Gateway

resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.project-vpc.id
}