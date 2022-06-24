output "bastion-public-ip" {
  value = aws_instance.bastion.public_ip
}

output "frontend-private-ip" {
  value = aws_instance.front-end.private_ip
}

output "backend-private-ip" {
  value = aws_instance.back-end.private_ip
}

output "backend-id" {
  value = aws_instance.back-end.id
}