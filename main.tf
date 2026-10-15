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