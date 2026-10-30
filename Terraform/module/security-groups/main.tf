###############################################################################################################################
#                                           Security Group
###############################################################################################################################

resource "aws_security_group" "infrawatch-sg" {
  name = "InfraWatch-Server-SG"
  description = "Security Group for InfraWatch Server"
  vpc_id = var.vpc-id
  ingress {
    from_port = var.ssh-port
    to_port = var.ssh-port
    protocol = "tcp"
    cidr_blocks = [var.my-ip]
    description = "Ingress rule for SSH from my IP Address"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.anywhere-ip]
    description = "Egress Rule open for all port from anywhere"
  }
  tags = {
    Name = "InfraWatch-Server-SG"
    IAC = "Terraform"
  }

}