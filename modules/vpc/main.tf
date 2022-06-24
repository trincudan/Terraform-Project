resource "aws_vpc" "primary-vpc" {
  cidr_block = var.vpc-cidr
}

resource "aws_vpc" "external-vpc" {
  cidr_block = var.external-vpc-cidr
}