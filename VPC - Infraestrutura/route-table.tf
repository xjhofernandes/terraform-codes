# Privado
resource "aws_route_table" "prv" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tg-dev-rt-prv-terraform-0"
  }

  depends_on = [
    aws_subnet.prv
  ]
}
resource "aws_main_route_table_association" "prv" {
  vpc_id         = aws_route_table.prv.vpc_id
  route_table_id = aws_route_table.prv.id
}
resource "aws_route_table_association" "prv" {
  subnet_id      = aws_subnet.prv.id
  route_table_id = aws_route_table.prv.id
  depends_on = [
    aws_route_table.prv
  ]
}

# Publico
resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }

  tags = {
    Name = "tg-dev-rt-pub-terraform-0"
  }

  depends_on = [
    aws_subnet.pub
  ]
}
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.pub.id
  depends_on = [
    aws_route_table.pub
  ]
}

#Natg
resource "aws_route_table" "natg" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natg.id
  }

  tags = {
    Name = "tg-dev-rt-natg-terraform-0"
  }

  depends_on = [
    aws_subnet.natg
  ]
}
resource "aws_route_table_association" "natg" {
  subnet_id      = aws_subnet.natg.id
  route_table_id = aws_route_table.natg.id
  depends_on = [
    aws_route_table.natg
  ]
}
