########Search Amazon AMI##############################
#--------------------------------------------------------------------------------------------
#Below code will search for the Amazon AMI based on the search criteria given.
#Only amazon linux version is kept as variable since other search criteria will remain same.
#---------------------------------------------------------------------------------------------
data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "description"
    values = ["*Linux*"]
  }

  filter {
    name   = "description"
    values = ["*${var.amazon_linux_version}*"]
  }

  filter {
    name   = "description"
    values = ["*inimal*"]
  }
}

###########Encrypt AMI###########################################################

#---------------------------------------------------------------------------------------
#This will clone the source AMI with Encryption using KMS key.
#Source AMI version will be decided by variable aws_provided_ami. If it is true it will
#use the AMI ID resulted from above search else it'll ask user for AMI ID.
#---------------------------------------------------------------------------------------

# resource "aws_ami_copy" "encrypted" {
#   name              = "${var.aws_provided_ami ? var.ami_name : var.customami_name}"
#   description       = "An encrypted AMI for ${var.project_name} - ${var.purpose}"
#   source_ami_id     = "${var.aws_provided_ami ? data.aws_ami.linux.id : var.image_id}"
#   source_ami_region = "${var.region}"
#   encrypted         = true
#   kms_key_id        = "${var.encryption_key_arn}"
#
#   tags {
#     Name         = "${var.aws_provided_ami ? var.ami_name : var.customami_name}"
#     project_name = "${var.project_name}"
#     purpose      = "${var.purpose}"
#   }
# }
