provider "aws" {
    region     = "eu-central-1"
}

module "instances" {
  source = "./modules/instances"
  public-subnet = module.subnets.public-id
  external-subnet = module.subnets.external-id
  private-subnet = module.subnets.private-id
  frontend-sg = module.security-group.fe-sg-id
  backend-sg = module.security-group.be-sg-id
  bastion-sg = module.security-group.ba-sg-id
}

module "vpc" {
  source = "./modules/vpc"
}

module "gateway" {
  source = "./modules/gateway"
  default_vpc = module.vpc.my_id
  external_vpc = module.vpc.external-vpc-id
}

module "subnets" {
  source = "./modules/subnets"
  default_vpc = module.vpc.my_id
  external_vpc = module.vpc.external-vpc-id
}

module "route-table" {
  source = "./modules/route-table"
  default_vpc = module.vpc.my_id
  external_vpc = module.vpc.external-vpc-id
  public-subnet = module.subnets.public-id
  external-subnet = module.subnets.external-id
  private-subnet = module.subnets.private-id
  main-gateway = module.gateway.main-gw
  external-gateway = module.gateway.external-gw
}

module "security-group" {
  source = "./modules/security_group"
  default_vpc = module.vpc.my_id
  external_vpc = module.vpc.external-vpc-id
}

module "network-interface" {
  source = "./modules/network-interface"
  private-subnet = module.subnets.private-id
  backend-instance = module.instances.backend-id
  backend-sg = module.security-group.be-sg-id

}