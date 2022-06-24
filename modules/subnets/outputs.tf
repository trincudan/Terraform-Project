output "public-id" {
  value = aws_subnet.public-subnet.id
}

output "private-id" {
  value = aws_subnet.private-subnet.id
}

output "external-id" {
  value = aws_subnet.external-subnet.id
}