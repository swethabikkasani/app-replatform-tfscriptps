
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
    values = ["*Red Hat, Inc.*"]
  }

  filter {
    name   = "name"
    values = ["RHEL*"]
  }

  filter {
    name   = "name"
    values = ["*GA*"]
  }

  filter {
    name   = "name"
    values = ["*${var.linux_version}*"]
  }

}

#----------------------------------------------------------------------------------------------------------------------------
#Creates KMS key and attaches the policy document kept in directory. Ideally it gives decrypt permission to Autoscaling role
#----------------------------------------------------------------------------------------------------------------------------

# module "kms" {
#   source         = "git::ssh://git@bitbucket.org/migfactoryautomation/tf_modules.git//aws/encryption/kms/"
#   kms_key_policy = "${file(var.KmsKeyPolicy)}"
#   var1           = "${var.account_number}"
#   var2           = "${data.terraform_remote_state.role.asg_role_arn}"
#   alias          = "${var.alias}"
# }

#------------------------------------------------------------------------------------------------------------------
#Encrypts the source ami
#-------------------------------------------------------------------------------------------------------------------
# module "ami" {
#   source               = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/ami/"
#   region               = "${var.region}"
#   project_name         = "${var.project_name}"
#   amazon_linux_version = "${var.amazonlinux_version}"
#   # encryption_key_arn   = "${module.kms.kms_alias_arn}"
#   aws_provided_ami     = "${var.aws_provided_ami}"
#   purpose              = "${var.purpose}"
#   ami_name             = "${var.ami_name}"
# }
