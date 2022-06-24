# -- PUBLIC SUBNET --
resource "aws_route_table" "public-route-table" {
  vpc_id = var.default_vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.main-gateway
  }
  tags = {
    Name = "Public Subnet Route Table"
  }
}

resource "aws_route_table_association" "public-route-table" {
  subnet_id = var.public-subnet
  route_table_id = aws_route_table.public-route-table.id
}

# -- PRIVATE SUBNET --
resource "aws_route_table" "private-route-table" {
  vpc_id = var.default_vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.main-gateway
  }
  tags = {
    Name = "Private Subnet Route Table"
  }
}

resource "aws_route_table_association" "private-route-table" {
  subnet_id = var.private-subnet
  route_table_id = aws_route_table.private-route-table.id
}

# -- EXTERNAL SUBNET --
resource "aws_route_table" "external-route-table" {
  vpc_id = var.external_vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.external-gateway
  }
  tags = {
    Name = "Private Subnet Route Table"
  }
}

resource "aws_route_table_association" "external-route-table" {
  subnet_id = var.external-subnet
  route_table_id = aws_route_table.external-route-table.id
}