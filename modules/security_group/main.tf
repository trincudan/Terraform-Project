resource "aws_security_group" "fe-sg" {
  name = var.FE-SG-name
  vpc_id = var.default_vpc

  dynamic "ingress" {
    for_each = var.fe-ingress-rules
    content {
      from_port  = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port  = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "be-sg" {
  name = var.BE-SG-name
  vpc_id = var.default_vpc

  dynamic "ingress" {
    for_each = var.be-ingress-rules
    content {
      from_port  = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port  = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ba-sg" {
  name = var.BA-SG-name
  vpc_id = var.external_vpc

  dynamic "ingress" {
    for_each = var.ba-ingress-rules
    content {
      from_port  = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port  = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}