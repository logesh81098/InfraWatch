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
  availability_zone = var.availability-zone-1
  tags = {
    Name = "InfraWatch-Public-Subnet"
    IAC = "Terraform"
  }
}



