resource "aws_instance" "front-end" {
    ami = var.Frontend_AMI-ID
    instance_type = "t2.micro"
    associate_public_ip_address = true
    subnet_id = var.public-subnet
    vpc_security_group_ids = [ var.frontend-sg ]
    key_name = "PrivKey"
    tags = {
        Name = "Frontend"
    }
}

resource "aws_instance" "back-end" {
    ami = var.Backend_AMI-ID
    instance_type = "t2.micro"
    subnet_id = var.private-subnet
    vpc_security_group_ids = [ var.backend-sg ]
    key_name = "PrivKey"
    tags = {
        Name = "Backend"
    }
}

resource "aws_instance" "bastion" {
    ami = var.Bastion_AMI-ID
    instance_type = "t2.micro"
    associate_public_ip_address = true
    subnet_id = var.external-subnet
    vpc_security_group_ids = [ var.bastion-sg ]
    key_name = "PrivKey"
    tags = {
        Name = "Bastion"
    }
}