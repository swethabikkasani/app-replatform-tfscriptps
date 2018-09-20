#------------Variable block-------------------------------------------------------------------------------------
# variable "KmsKeyPolicy" {
#   default = "kms-policy.json.tpl"
# }
#
# variable "account_number" {
#   default = "919476868523"
# }

variable "alias" {
  default = "ami_encryption_dev_key"
}

variable "aws_provided_ami" {
  default = "true"
}

variable "linux_version" {
  default = "7.5"
}

variable "purpose" {
  default = "AMI for dev Environment"
}

variable "ami_name" {
  default = "Amazon_linux-hvm-2018.03.0.x86_64 "
}

variable "project_name" {
  default = "Replatform"
}

variable "region" {
  default = ""
}
