# # Create vpc

resource "aws_vpc" "project-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project"
  }
}