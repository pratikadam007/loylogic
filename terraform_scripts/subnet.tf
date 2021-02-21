resource "aws_subnet" "spring-public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.20.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "spring-public"
  }
}

resource "aws_subnet" "spring-private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.20.20.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "spring-private"
  }
}