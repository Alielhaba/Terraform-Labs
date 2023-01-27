resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.tables-name[0]
  }
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet[0].id
  route_table_id = aws_route_table.public_route.id
}


resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nw.id
  }

  tags = {
    Name = var.tables-name[1]
  }
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.subnet[1].id
  route_table_id = aws_route_table.private_route.id
}