module "virtual-private-network" {
  source = "./module/vpc"
}

module "security-groups" {
  source = "./module/security-groups"
  vpc-id = module.virtual-private-network.infrawatch-vpc-id
}

module "keypairs" {
  source = "./module/key pairs"
}

module "identity-and-access-management" {
  source = "./module/iam"
}

module "elastic-compute-cloud" {
  source = "./module/ec2-instance"
  infrawatch-public-subnet-id = module.virtual-private-network.infrawatch-public-subnet-1-id
  infrawatch-sg = module.security-groups.infrawatch-server-sg
  infrawatch-keypair = module.keypairs.infrawatch-keypair
  infrawatch-instance-profile = module.identity-and-access-management.infrawatch-instance-profile
}