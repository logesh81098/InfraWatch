module "virtual-private-network" {
  source = "./module/vpc"
}

module "security-groups" {
  source = "./module/security-groups"
  vpc-id = module.virtual-private-network.infrawatch-vpc-id
}