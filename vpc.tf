resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc-cider
}

resource "aws_subnet" "subnet" {
    count=2
    cidr_block = var.sub-ip[count.index]
    vpc_id = aws_vpc.my_vpc.id
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_nat_gateway" "nw" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.subnet[0].id
  tags = {
    Name = var.nat-gw
  }
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "eip-nat" {
  vpc = true
}