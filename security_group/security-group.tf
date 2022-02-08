resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Permite o acesso ao ssh"
  vpc_id      = "vpc-056c3c9fc0591615a"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["189.40.18.26/32"]
  }

  tags = {
    Name = "permite_acesso_ssh"
  }
  
}
