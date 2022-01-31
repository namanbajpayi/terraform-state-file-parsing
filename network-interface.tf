# #  Create a network interface with an ip in the public subnet

resource "aws_network_interface" "pub-server-nic" {
  subnet_id       = aws_subnet.subnet-pub.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.project-sg.id]
}