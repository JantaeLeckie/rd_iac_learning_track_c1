terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#set up vpc
resource "aws_vpc" "jantae_vpc" {
  cidr_block           = "172.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Jantae VPC"
  }
}

#set up public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.jantae_vpc.id
  cidr_block        = "172.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}


#set up internet gateway
resource "aws_internet_gateway" "jantae_vpc_igw" {
  vpc_id = aws_vpc.jantae_vpc.id

  tags = {
    Name = "Jantae VPC - Internet Gateway"
  }
}

#set up route table
resource "aws_route_table" "jantae_vpc_us_east_1_public" {
  vpc_id = aws_vpc.jantae_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jantae_vpc_igw.id
  }

  tags = {
    Name = "Public Subnet Route Table."
  }
}


#link public subnet to route table
resource "aws_route_table_association" "jantae_vpc_us_east_1_public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.jantae_vpc_us_east_1_public.id
}

