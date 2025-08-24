provider "aws" {
  region = var.region
}

module "iam" {
  source = "./modules/iam"
}

module "s3bucket" {
  source = "./modules/s3bucket"
  bucket_name = var.bucket_name
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr   # pass root variable to module
  cidr_block = var.cidr_block
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
  subnet_cidr = var.subnet_cidr
  subnet_az = var.subnet_az
}

module "security" {
  source              = "./modules/security"
  name                = var.name
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
}

module "keypair" {
  source = "./modules/keypair"

}

module "emr" {
  source                    = "./modules/emr"
  name                      = var.name
  release_label             = var.release_label
  applications              = var.applications
  subnet_id                 = module.subnets.subnet_id
  key_name                  = module.keypair.key_name
  master_instance_type      = var.master_instance_type
  master_ebs_size           = var.master_ebs_size
  core_instance_type        = var.core_instance_type
  core_instance_count       = var.core_instance_count
  core_ebs_size             = var.core_ebs_size
  emr_master_security_group = module.security.emr_master_security_group
  emr_slave_security_group  = module.security.emr_slave_security_group
  emr_ec2_instance_profile  = module.iam.emr_ec2_instance_profile
  emr_service_role          = module.iam.emr_service_role
  emr_autoscaling_role      = module.iam.emr_autoscaling_role
  log_uri = module.s3bucket.emr_log_uri
}
