resource "aws_subnet" "prv" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "tg-dev-subn-prv-terraform-0-a"
  }

  depends_on = [
    aws_vpc.main
  ]
}


resource "aws_subnet" "pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "tg-dev-subn-pub-terraform-0-a"
  }

  depends_on = [
    aws_vpc.main
  ]  
}


resource "aws_subnet" "natg" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "tg-dev-subn-natg-terraform-0-a"
  }
  depends_on = [
    aws_vpc.main
  ]
}
