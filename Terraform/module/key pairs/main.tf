###############################################################################################################################
#                                           Key Pairs
###############################################################################################################################

resource "tls_private_key" "infrawatch-key" {
  algorithm = "RSA"
  rsa_bits = 4098
}

resource "aws_key_pair" "infrawatch-public-key" {
  key_name = "InfraWatch-Keypair"
  public_key = tls_private_key.infrawatch-key.public_key_openssh
}

resource "local_file" "infrawatch-private-key" {
  filename = "InfraWatch-privatekey.pem"
  content = tls_private_key.infrawatch-key.private_key_openssh
}