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

resource "aws_instance" "dev" {
  count = 2
  ami = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  key_name = "tg-dev-useast1-dbot"
  tags = {
      Name = "tg-ec2-terraform-${count.index}"
  }
  subnet_id = "subnet-00a8bbc3ad94c8c3a"
}
