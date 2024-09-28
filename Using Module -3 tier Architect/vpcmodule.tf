module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"
name = "${local.name}-${var.vpcname}"
cidr = var.vpccidr
azs = var.vpcaz
public_subnets = var.publicsub
private_subnets = var.privatesub
database_subnets = var.DBsub
#create_database_subnet_group = var.DBsubg
create_database_subnet_route_table = var.DBsubrt
enable_dns_hostnames = true
enable_dns_support   = true
enable_nat_gateway = var.vpcngw
single_nat_gateway = var.vpcsngw
tags = local.common_tags
vpc_tags = local.common_tags
public_subnet_tags = {
    Type = "Private Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}
