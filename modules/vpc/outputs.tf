output "my_id" {
  value = aws_vpc.primary-vpc.id
}

output "external-vpc-id" {
  value = aws_vpc.external-vpc.id
}
