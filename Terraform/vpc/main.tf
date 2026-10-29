###############################################################################################################################
#                                                  VPC Module
###############################################################################################################################

resource "aws_vpc" "infrawatch" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "InfraWatch-VPC"
    IAC = "Terraform"
  }
}



###############################################################################################################################
#                                             VPC - Public Subnet
###############################################################################################################################

resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.infrawatch.id
  cidr_block = var.public-subnet-1-cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "InfraWatch-Public-Subnet-1"
    IAC = "Terraform"
  }
}


###############################################################################################################################
#                                           VPC - Internet Gateway
###############################################################################################################################

resource "aws_internet_gateway" "infrawatch-igw" {
  vpc_id = aws_vpc.infrawatch.id
  tags = {
    Name = "InfraWatch-Internet Gateway"
    IAC = "Terraform"    
  }
}


###############################################################################################################################
#                                             VPC - Route Table
###############################################################################################################################

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.infrawatch.id
  route {
    gateway_id = aws_internet_gateway.infrawatch-igw.id
    cidr_block = var.anywhere-ip
  }
  tags = {
    Name = "InfraWatch-Public-RouteTable"
    IAC = "Terraform"
  }
}


###############################################################################################################################
#                                          VPC - Route Table Association
###############################################################################################################################

resource "aws_route_table_association" "Public-rt" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public-subnet-1.id
}

