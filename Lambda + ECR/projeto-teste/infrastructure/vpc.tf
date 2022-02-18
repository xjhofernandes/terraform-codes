# Obtendo listagem de subnets da VPC
data "aws_subnet" "selected" {
  count = 3
  filter {
    name = "tag:Name"
    values = [
      local.subnets[count.index]
    ]
  }
}

# Obtendo listagem de security groups da VPC
data "aws_security_group" "selected" {
  filter {
    name = "tag:Name"
    values = [
      local.security_group
    ]
  }
}
