output "infrawatch-vpc-id" {
  value = aws_vpc.infrawatch.id
}

output "infrawatch-public-subnet-1-id" {
  value = aws_subnet.public-subnet-1.id
}