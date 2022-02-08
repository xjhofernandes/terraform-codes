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


resource "aws_instance" "dev1" {
  ami = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  key_name = "tg-dev-useast1-sshtunnel1"
  tags = {
      Name = "teste_ec2_terraform_1"
  }
  vpc_security_group_ids = [aws_security_group.acesso_ssh.id]
  subnet_id = "subnet-00a8bbc3ad94c8c3a"

  depends_on = [
    aws_s3_bucket.b
  ]
}
