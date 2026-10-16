output "infrawatch-vpc-id" {
  value = aws_vpc.infrawatch-vpc.id
}

output "infrawatch-public-subnet-id" {
  value = aws_subnet.public-subnet.id
}