resource "aws_route_table" "spring-public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {
    Name = "spring-public-rt"
  }
}

# route associations public
resource "aws_route_table_association" "spring-public-rta" {
  subnet_id      = aws_subnet.spring-public.id
  route_table_id = aws_route_table.spring-public-rt.id
}

resource "aws_route_table" "spring-private-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "spring-private-rt"
  }
}

# route associations private
resource "aws_route_table_association" "spring-private-rta" {
  subnet_id      = aws_subnet.spring-private.id
  route_table_id = aws_route_table.spring-private-rt.id
}