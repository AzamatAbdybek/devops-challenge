#Deploy Networking Resources
#============================
module "vpc" {
  source = "./modules/vpc"
}

#Deploy Compute Resources
#============================
module "compute" {
  source         = "./modules/compute"
  machine_type = "t2.micro"
  security_group = module.vpc.public_sg
  environment_code = "p"
  instance_name = "db-srv001"
  public_ip_required = true
  subnets        = module.vpc.public_subnets
}

