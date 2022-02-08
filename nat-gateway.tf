resource "aws_network_interface" "natg" {
  subnet_id   = aws_subnet.pub.id
  private_ips = ["10.0.0.147"]

  tags = {
    Name = "tg-dev-neti-terraform-0"
  }
}

resource "aws_eip" "natg" {
  vpc                       = true
  #network_interface         = aws_network_interface.natg.id
  #associate_with_private_ip = "10.0.0.147"

  tags = {
    Name = "tg-dev-elip-natg-terraform-0"
  }
}

resource "aws_nat_gateway" "natg" {
  allocation_id = aws_eip.natg.allocation_id
  subnet_id     = aws_subnet.pub.id

  tags = {
    Name = "tg-dev-natg-terraform-0"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.dev]
}
