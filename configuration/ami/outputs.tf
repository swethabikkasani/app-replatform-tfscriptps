# output "encrypted_ami_id" {
#   value = "${module.ami.encrypted_ami_id}"
# }

# output "linux_ami_id" {
#   value = "${module.ami.linux_ami_id}"
# }

output "linux_ami_id" {
  value = "${data.aws_ami.linux.id}"
}

# output "kms_alias_arn" {
#   value = "${module.kms.kms_alias_arn}"
# }
