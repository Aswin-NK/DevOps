module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
   version = "5.6.0"

name = "${var.environment}-private"
ami = "ami-0490fddec0cbeb88b"
instance_type = var.instance_type
#subnet_id = module.vpc.public_subnets[0]
for_each = toset(["0", "1"])
  subnet_id =  element(module.vpc.private_subnets, tonumber(each.key))
vpc_security_group_ids = [module.private_bastion_sg.security_group_id]
user_data = file("./app1-install.sh")
key_name = var.keypair
tags = local.common_tags
}