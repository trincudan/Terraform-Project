resource "aws_subnet" "public-subnet" {
  vpc_id = var.default_vpc
  cidr_block = var.public-subnet
}

resource "aws_subnet" "private-subnet" {
  vpc_id = var.default_vpc
  cidr_block = var.private-subnet
}

resource "aws_subnet" "external-subnet" {
  vpc_id = var.external_vpc
  cidr_block = var.external-subnet
}