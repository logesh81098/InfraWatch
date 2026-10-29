###############################################################################################################################
#                                          EC2 Instance
###############################################################################################################################

resource "aws_instance" "infrawatch-server" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.infrawatch-public-subnet-id
  vpc_security_group_ids = [var.infrawatch-sg]
  key_name = var.infrawatch-keypair
  iam_instance_profile = var.infrawatch-instance-profile
  tags = {
    Name = "InfraWatch Server"
    IAC = "Terraform"
  }
}