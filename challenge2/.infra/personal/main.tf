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
resource "aws_vpc" "iac_challenge2_vpc" {
  cidr_block           = "172.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "iac_challenge2 VPC"
  }
}

#set up public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.iac_challenge2_vpc.id
  cidr_block        = "172.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}


#set up internet gateway
resource "aws_internet_gateway" "iac_challenge2_vpc_igw" {
  vpc_id = aws_vpc.iac_challenge2_vpc.id

  tags = {
    Name = "iac_challenge2 VPC - Internet Gateway"
  }
}

#set up route table
resource "aws_route_table" "iac_challenge2_vpc_us_east_1_public" {
  vpc_id = aws_vpc.iac_challenge2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iac_challenge2_vpc_igw.id
  }

  tags = {
    Name = "Public Subnet Route Table."
  }
}


#link public subnet to route table
resource "aws_route_table_association" "iac_challenge2_vpc_us_east_1_public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.iac_challenge2_vpc_us_east_1_public.id
}

