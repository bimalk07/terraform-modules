module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  vpc_tenancy = var.vpc_tenancy
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr
  subnet_zone = var.subnet_zone
  subnet_name = var.subnet_name
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  Name_igw = var.Name_igw
}

module "public_rt" {
  source           = "./modules/route_table_public"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_id
  igw_id           = module.igw.igw_id
  Name_rt          = var.Name_public_rt
}

# NAT
module "nat_gw" {
  source              = "./modules/nat_gateway"
  vpc_id              = module.vpc.vpc_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  Name_nat            = var.Name_nat
  Name_private_rt     = var.Name_private_rt
}

resource "aws_instance" "public_instance" {
  ami                         = var.ami_public
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.subnets.public_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.Name_public_instance
  }
}

resource "aws_instance" "private_instance" {
  ami                         = var.ami_private
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.subnets.private_subnet_id
  associate_public_ip_address = false

  tags = {
    Name = var.Name_private_instance
  }
}