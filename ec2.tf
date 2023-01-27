resource "aws_instance" "public-instance" {
  ami           = var.ami_id
  instance_type = var.inestace-type

  tags = {
    Name = var.instance-name[0]
  }
  user_data = <<EOF
#!/bin/bash
# install httpd (Linux Version2)
yum update -y
yum -y install httpd
systemctl start httpd
systemctl enable httpd
EOF

  subnet_id = aws_subnet.subnet[0].id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.public.id]

}

resource "aws_instance" "private-instance" {
  ami           = var.ami_id
  instance_type = var.inestace-type

  tags = {
    Name = var.instance-name[1]
  }
  user_data = <<EOF
#!/bin/bash
# install httpd (Linux Version2)
yum update -y
yum -y install httpd
systemctl start httpd
systemctl enable httpd
EOF

  subnet_id = aws_subnet.subnet[1].id
  vpc_security_group_ids = [aws_security_group.private.id]

}
