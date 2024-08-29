# define the AWS provider
 provider "aws" {
   region = "us-west-2"
}

# Define a VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
 
  tags = {
    Name = "terraform-vpc"
  }
}

# Create Public Subnet 1
resource "aws_subnet" "pub_subnet_1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a" 
  
  tags = {
    Name = "pub-subnet-1"
  }
}

# Create Public Subnet 2
resource "aws_subnet" "pub_subnet_2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2b"  
  
  tags = {
    Name = "pub-subnet-2"
  }
}

# Create Private Subnet 1
resource "aws_subnet" "priv_subnet_1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-west-2a"  
  
  tags = {
    Name = "priv-subnet-1"
  }
}

# Create Private Subnet 2
resource "aws_subnet" "priv_subnet_2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-west-2b"  
 

  tags = {
    Name = "priv-subnet-2"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

# Create a route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pub-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "priv-route-table"
  }
}

# Associate the public subnets with the route table
resource "aws_route_table_association" "rta_public_subnet_1" {
  subnet_id      = aws_subnet.pub_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "rta_public_subnet_2" {
  subnet_id      = aws_subnet.pub_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "rta_pivate_subnet_1" {
  subnet_id      = aws_subnet.priv_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "rta_private_subnet_2" {
  subnet_id      = aws_subnet.priv_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}