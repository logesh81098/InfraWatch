module "vpc" {
  source = "./module/vpc"
}

module "iam" {
  source = "./module/iam"
}

module "security-group" {
  source = "./module/security-group"
  infrawatch-vpc-id = module.vpc.infrawatch-vpc-id
}

module "keypair" {
  source = "./module/keypair"
}

module "ec2-instance" {
  source = "./module/ec2-instance"
  keypair-name = module.keypair.keypair-name
  subnet = module.vpc.infrawatch-public-subnet-id
  security-group = module.security-group.infrwatch-server-sg
  iam-role = module.iam.infrawatch-server-iam-role
}