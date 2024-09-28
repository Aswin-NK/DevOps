variable "instancetype" {
    type = list(string)
    description = "Instane type of instance"
    default = [ "t2.nano","t2.micro","t2.msmall" ]
    
  
}