variable "FE-SG-name" {
  default = "Front-end"
}

variable "BE-SG-name" {
  default = "Back-end"
}

variable "BA-SG-name" {
  default = "Back-end"
}

variable "default_vpc" {
  description = "Default VPC"
}

variable "external_vpc" {
  description = "External VPC"
}


# FRONT-END SECURITY GROUP
variable fe-ingress-rules {
  type = list( object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
default = [{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["5.0.2.0/24"]
    #cidr_blocks = [ "${bastion-private-ip}/32", "${chomp(data.http.myip.body)}/32" ]
  },
  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

# BACK-END SECURITY GROUP
variable be-ingress-rules {
  type = list( object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
default = [{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["5.0.2.0/24"]
    #cidr_blocks = [ "${bastion-public-ip}/32", "${chomp(data.http.myip.body)}/32" ]
  },
  {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["5.0.1.0/24"]
    #cidr_blocks = ["${backend-private-ip}"]
  }]
}

# BASTION SECURITY GROUP
variable ba-ingress-rules {
  type = list( object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
default = [{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [""]
    #cidr_blocks = [ "${chomp(data.http.myip.body)}/32" ]
  }]
}