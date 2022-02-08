terraform {
  required_providers{
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.27"
      }
  }
}

provider "aws" {
  region = "us-east-1"
}

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

resource "aws_instance" "dev" {
  ami = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  key_name = "tg-dev-useast1-sshtunnel1"
  tags = {
      Name = "teste_ec2_terraform"
  }
  vpc_security_group_ids = [aws_security_group.acesso_ssh.id]
  subnet_id = "subnet-00a8bbc3ad94c8c3a"
}
