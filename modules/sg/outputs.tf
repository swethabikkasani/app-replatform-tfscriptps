output "security_group_id" {
  description = "The ID of the security group"
  value       = "${element(concat(aws_security_group.sg.*.id, list("")), 0)}"
}

output "sg_name" {
  value = "${element(concat(aws_security_group.sg.*.name, list("")), 0)}"
}

output "sg_description" {
  description = "The description of the security group"
  value       = "${element(concat(aws_security_group.sg.*.description, list("")), 0)}"
}
