#------------------------------------------------------------
#Bastion output block
#------------------------------------------------------------
# output "bastion_eip" {
#   value = "${aws_eip.bastion.*.public_ip}"
# }

#-------------------------------------------------------------
#Security group block
#--------------------------------------------------------------
output "sg_id" {
  value = "${module.sg.security_group_id}"
}

output "instance_id" {
  value = "${module.ec2.id}"
}

output "public_ip" {
  value = "${module.ec2.public_ip}"
}

output "private_ip" {
  value = "${module.ec2.private_ip}"
}

output "key_name" {
  value = "${module.ec2.key_name}"
}
