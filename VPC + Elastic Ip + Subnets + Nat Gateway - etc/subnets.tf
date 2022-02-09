resource "aws_subnet" "prv" {
  count = length(var.subn_prv)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subn_prv[count.index].cidr_block
  tags = {
    Name = var.subn_prv[count.index].name
  }

  depends_on = [
    aws_vpc.main
  ]
}


resource "aws_subnet" "pub" {
  count = length(var.subn_pub)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subn_pub[count.index].cidr_block
  tags = {
    Name = var.subn_pub[count.index].name
  }

  depends_on = [
    aws_vpc.main
  ]
}


resource "aws_subnet" "natg" {
  count = length(var.subn_natg)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subn_natg[count.index].cidr_block
  tags = {
    Name = var.subn_natg[count.index].name
  }

  depends_on = [
    aws_vpc.main
  ]
}
