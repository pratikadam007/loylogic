# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "nat_ip" {
    vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.spring-public.id
    depends_on = ["aws_internet_gateway.main-gw"]
}