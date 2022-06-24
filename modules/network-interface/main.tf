resource "aws_network_interface" "test" {
  subnet_id       = var.private-subnet
  private_ips     = ["5.0.2.50"]
  security_groups = [var.backend-sg]

  attachment {
    instance     = var.backend-instance
    device_index = 1
  }
}