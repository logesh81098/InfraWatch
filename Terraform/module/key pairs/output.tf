output "infrawatch-keypair" {
  value = aws_key_pair.infrawatch-public-key.key_name
}