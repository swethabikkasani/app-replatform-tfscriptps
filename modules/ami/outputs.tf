output "linux_ami_id" {
  value = "${data.aws_ami.linux.id}"
}

# output "encrypted_ami_id" {
#   value = "${aws_ami_copy.encrypted.id}"
# }
