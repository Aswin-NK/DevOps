variable "vpcname" {
    type = string
    default = "myvpc"
    description = "Sample VPC" 
}
variable "vpccidr" {
    type = string
    default = "10.0.0.0/16"
    description = "VPC CIDR"
  
}
 variable "vpcaz" {
    type = list(string)
    default = [ "us-east-1a", "us-east-1b"]
    description = "Availability Zone"
 }
 variable "publicsub" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24"]
    description = "Public Subnet CIDR"
 }
 variable "privatesub" {
    type = list(string)
    default = [ "10.0.3.0/24", "10.0.4.0/24" ]
    description = "Private Subnet CIDR"
 }
 variable "DBsub" {
    type = list(string)
    default = [ "10.0.5.0/24", "10.0.6.0/24" ]
    description = "Private Subnet CIDR"
 }
variable "DBsubsg" {
    type = bool
    default = true
    description = "Creating DB subnet Secruity Group"
  
}
variable "DBsubrt" {
    type = bool
    default = true
    description = "Creating Db subnet Route Table"  
}
variable "vpcngw" {
    type = bool
    default = true
    description = "Creating Nat Gateway"
  
}
variable "vpcsngw" {
   type = bool
   default = true
   description = "Creating single Nat Gateway"
}