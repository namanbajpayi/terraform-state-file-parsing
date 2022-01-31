# #  Create Nat Gateway
resource "aws_nat_gateway" "project-ngw" {
 allocation_id     = aws_eip.nat-eip.id
 subnet_id         = aws_subnet.subnet-pub.id

  tags = {
    Name = "project-nat-gateway"
  }
}