resource "aws_instance" "firstinstance" {
    instance_type = var.instancetype[1]
    ami = data.aws_ami.myami.id
    key_name = "aug23"
    vpc_security_group_ids = [ aws_security_group.sg1.id, aws_security_group.sg2.id]
    count = 2
    user_data = file("./install.sh")
    tags = {
      "Name" = "Instance-${count.index}"
    }
}
resource "tls_private_key" "key1" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}
resource "local_file" "private_key" {
    content = tls_private_key.key1.private_key_pem
    filename = "aug23"
  
}
resource "aws_key_pair" "mykey" {
    key_name = "aug23"
    public_key = tls_private_key.key1.public_key_openssh
  
}