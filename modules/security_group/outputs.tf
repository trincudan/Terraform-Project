output "fe-sg-id" {
  description = "ID of the Frontend's Security Group"
  value = aws_security_group.fe-sg.id
}

output "be-sg-id" {
  description = "ID of the Backend's Security Group"
  value = aws_security_group.be-sg.id
}

output "ba-sg-id" {
  description = "ID of the Bastion's Security Group"
  value = aws_security_group.ba-sg.id
}