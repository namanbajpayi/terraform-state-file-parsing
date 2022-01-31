resource "aws_eip" "nat-eip" {
  depends_on                = [aws_internet_gateway.project-igw]
}

resource "aws_eip" "ig-eip" {
  vpc                       = true
  network_interface         = aws_network_interface.pub-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.project-igw,aws_instance.public-instance]
}