output "publicinstance" {
    value = module.ec2_public.id
    description = "Public Instance Id"
  
}
output "publicip" {
    value = module.ec2_public.public_ip
    description = "Public IP"
  
}
output "privateinstance" {
    value = [for i in module.ec2_private: i.id]
    description = "Private Instance ID" 
}
output "privateip" {
    value = [for i in module.ec2_private: i.private_ip]
    description = "Private Instance ID" 
}
