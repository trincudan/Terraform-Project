output "main-gw" {
  value = aws_internet_gateway.main-gw.id
}

output "external-gw" {
  value = aws_internet_gateway.external-gw.id
}