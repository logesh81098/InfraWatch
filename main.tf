module "vpc" {
  source = "./module/vpc"
}

module "iam" {
  source = "./module/iam"
}