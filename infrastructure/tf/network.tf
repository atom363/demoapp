resource "aws_vpc" "demoapp-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "demoapp-vpc"
  }
}
resource "aws_subnet" "demoapp-public-subnet" {
  vpc_id            = aws_vpc.demoapp-vpc.id
  cidr_block        = var.public_subnet_cidr
}
resource "aws_internet_gateway" "demoapp-gw" {
  vpc_id = aws_vpc.demoapp-vpc.id
}
resource "aws_route_table" "demoapp-public-rt" {
  vpc_id = aws_vpc.demoapp-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demoapp-gw.id
  }
}
resource "aws_route_table_association" "demoapp-public-rt-association" {
  subnet_id      = aws_subnet.demoapp-public-subnet.id
  route_table_id = aws_route_table.demoapp-public-rt.id
}