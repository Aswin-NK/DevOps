module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

name = "${var.environment}-public"
ami = "ami-0490fddec0cbeb88b"
instance_type = var.instance_type
subnet_id = module.vpc.public_subnets[0]
vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
key_name = var.keypair
tags = local.common_tags
}