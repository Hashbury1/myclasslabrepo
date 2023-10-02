# for my ec2 instance
resource "aws_instance" "for_public_access" {
   instance_type = "t2.micro"
   availability_zone = "Us-east-1"
   ami               = "03a6eaae9938c858c"

   tags = {
    Name = var.instance_name
   }
}   

# VPC
resource "aws_vpc" "test-terraform" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "testing"
  }
}

# pub subnet
resource "aws_subnet" "pub-aws_subnet" {
  vpc_id            = aws_vpc.test-terraform.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "pub for testing"
  }
}


# my private subnet
resource "aws_subnet" "priv-aws_subnet" {
  vpc_id            = aws_vpc.test-terraform.id
  cidr_block        = "10.2.0.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Priv for testing"
  }
}

# security group
resource "aws_security_group" "for_public_access" {
  name        = "public access"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.test-terraform.id

  ingress {
    description      = "public access"
    from_port        = 443
    to_port          = 443
    protocol         = "-1"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public access"
  }
}