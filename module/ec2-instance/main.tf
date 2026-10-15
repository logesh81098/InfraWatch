#############################################################################################################################
#                                            EC2 Instance
#############################################################################################################################

resource "aws_instance" "infrawatch-server" {
  ami = var.ami-id
  instance_type = var.instance-type
  key_name = var.keypair-name
  subnet_id = var.subnet
  vpc_security_group_ids = [var.security-group]
  iam_instance_profile = var.iam-role
  tags = {
    Name = "InfraWatch-Server"
    IAC = "Terraform"
  }
}