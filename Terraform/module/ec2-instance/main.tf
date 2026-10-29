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
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted = true
    delete_on_termination = true
  }
  tags = {
    Name = "InfraWatch Server"
    IAC = "Terraform"
  }
}