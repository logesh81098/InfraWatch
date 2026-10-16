#############################################################################################################################
#                                               VPC Module
#############################################################################################################################

resource "aws_vpc" "infrawatch-vpc" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "InfraWatch-VPC"
    IAC = "Terraform"
  }
}


#############################################################################################################################
#                                                VPC Subnet
#############################################################################################################################

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.infrawatch-vpc.id
  cidr_block = var.public-subnet-cidr
  map_public_ip_on_launch = true
  availability_zone = var.availability-zone-1
  tags = {
    Name = "InfraWatch-Public-Subnet"
    IAC = "Terraform"
  }
}


#############################################################################################################################
#                                              Internet Gateway
#############################################################################################################################

resource "aws_internet_gateway" "infrawatch-igw" {
  vpc_id = aws_vpc.infrawatch-vpc.id
  tags = {
    Name = "InfraWatch-IGW"
    IAC = "Terraform"
  }
}


#############################################################################################################################
#                                                VPC Route Table
#############################################################################################################################

resource "aws_route_table" "infrawatch-public-route-table" {
  vpc_id = aws_vpc.infrawatch-vpc.id
  route {
    gateway_id = aws_internet_gateway.infrawatch-igw.id
    cidr_block = var.anywhere-ip
  }
  tags = {
    Name = "InfraWatch-Public-RT"
    IAC = "Terraform"
  }
}

#############################################################################################################################
#                                          RouteTable Subnet Association
#############################################################################################################################

resource "aws_route_table_association" "public-route-table-association" {
  route_table_id = aws_route_table.infrawatch-public-route-table.id
  subnet_id = aws_subnet.public-subnet.id
}

