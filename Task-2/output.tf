data "aws_availability_zones" "myzone" {
    filter {
      name = "opt-in-status"
      values = [ "opt-in-not-required" ]
    }
  
}

data "aws_ec2_instance_type_offerings" "myinstancetype" {
    for_each = toset(data.aws_availability_zones.myzone.names)
    filter {
        name = "instance-type"
        values = [ "t3.micro"]
    }
    filter {
      name = "location"
      values = [ each.key ]

    }
    location_type = "availability-zone"
}

output "output1" {
    description ="Normal Output"
    value = {for az, details in data.aws_ec2_instance_type_offerings.myinstancetype: az => details.instance_types}
}
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.myinstancetype: 
    az => details.instance_types if length(details.instance_types) != 0 }
}

# Output-3
# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "output_v3_3" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.myinstancetype: 
    az => details.instance_types if length(details.instance_types) != 0 })
}


# Output-4 (additional learning)
# Filtered Output: As the output is list now, get the first item from list (just for learning)
output "output_v3_4" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.myinstancetype: 
    az => details.instance_types if length(details.instance_types) != 0 })[0]
}