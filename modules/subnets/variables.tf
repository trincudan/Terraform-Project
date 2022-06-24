variable "public-subnet" {
  default = "5.0.1.0/24"
}

variable "private-subnet" {
  default = "5.0.2.0/24"
}

variable "external-subnet" {
  default = "6.0.1.0/24"
}

variable "default_vpc" {
  description = "Default VPC"
}

variable "external_vpc" {
  description = "Default VPC"
}