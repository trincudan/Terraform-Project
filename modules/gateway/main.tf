resource "aws_internet_gateway" "main-gw" {
  vpc_id = var.default_vpc
  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_internet_gateway" "external-gw" {
  vpc_id = var.external_vpc
  tags = {
    Name = "External Internet Gateway"
  }
}
