resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tg-dev-igw-terraform-0"
  }
}
