


# Create a VPC
resource "aws_vpc" "hash-new" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "recent"
  }
}

# create private subnet
resource "aws_subnet" "priv-sub" {
  vpc_id     = aws_vpc.hash-new.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "priv"
  }
}

# create pub subnet
resource "aws_subnet" "pub-sub" {
  vpc_id     = aws_vpc.hash-new.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "pub"
  }
}

# create private route table 
resource "aws_route_table" "priv-RT" {
  vpc_id = aws_vpc.hash-new.id

  tags = {
    Name = "for private"
  }
}

# create public route table
resource "aws_route_table" "pub-RT" {
  vpc_id = aws_vpc.hash-new.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "for public"
  }
}

# create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.hash-new.id

  tags = {
    Name = "for my VPC"
  }
}

# create security group
resource "aws_security_group" "allow-all" {
  name        = "public-allow"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hash-new.id
}


# create key pair 

data "aws_key_pair" "test-NV" {
  key_name           = "test-NV"
  include_public_key = true
}

