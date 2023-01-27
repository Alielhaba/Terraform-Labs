resource "aws_security_group" "public" {
  name        = var.SG-name[0]
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public"
  }
}

resource "aws_security_group" "private" {
  name        = var.SG-name[1]
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "private"
  }
}
# resource "aws_network_interface_sg_attachment" "sg_attachment" {
# security_group_id    = aws_security_group.allow_tls.id
# network_interface_id = aws_instance.web.primary_network_interface_id
# }