variable "environment" {
    type = string
    default = "dev"
    description = "Environment varible used as prefix"
  
}

variable "businessdivision" {
    type = string
    default = "SAP"
    description = "Business Division"
  
}
variable "keypair" {
    type = string
    default = "my-key"
    description = "My key for instance using terraform"
  
}
resource "aws_key_pair" "mykey" {
    key_name = tls_private_key.privatekey.public_key_openssh
    public_key = "my-key"
}

resource "tls_private_key" "privatekey" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}

resource "local_file" "pri" {
    content = tls_private_key.privatekey.private_key_pem
    filename = "my-key"
}