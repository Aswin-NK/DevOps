output "myoutput" {
    description = "My first project output"
    value = [ for x in aws_instance.firstinstance: x.public_ip]
}