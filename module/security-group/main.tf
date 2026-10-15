#############################################################################################################################
#                                           Security Group
#############################################################################################################################

resource "aws_security_group" "infrawatch-sg" {
  name = "InfraWatch-Server-SecurityGroup"
  description = "Security Group of InfraWatch Server"
  vpc_id = var.infrawatch-vpc-id
  ingress {
    from_port = var.ssh-port
    to_port = var.ssh-port
    protocol = "tcp"
    cidr_blocks = [var.my-public-ip]
    description = "SSH port allowed for my public ip"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.anywhere-ip]
  }
  tags = {
    Name = "InfraWatch-Server-SecurityGroup"
    IAC = "Terraform"
  }

}