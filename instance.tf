resource "aws_instance" "public-instance" {
  ami               = "ami-0a8b4cd432b1c3063"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "project-key"
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.pub-server-nic.id
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "public-server"
  }
}

resource "aws_instance" "private-instance" {
  ami               = "ami-0a8b4cd432b1c3063"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  key_name          = "project-key"
  subnet_id         = aws_subnet.subnet-priv.id
  vpc_security_group_ids = [aws_security_group.project-sg.id]
  associate_public_ip_address = false 

  user_data = <<-EOF
                #!/bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "private-server"
  }
}