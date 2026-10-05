module "vpc_dev" {
  source = "../modules/vpc"

  name    = var.vpc_name
  subnets = var.subnets
}
