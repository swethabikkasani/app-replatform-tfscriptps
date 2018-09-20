variable "project_name" {}
variable "region" {} # e.g. "us-west-2"
variable "amazon_linux_version" {} # e.g. "2017.03.0"

# variable "encryption_key_arn" {
#   description = "KMS key arn output from KMS module"
# }

variable "aws_provided_ami" {
  description = "Set it true if you use want to use amazon linux as OS or set it false if you want to encrypt custom AMI"
}

variable "image_id" {
  description = "Image ID of your custom AMI only if aws_provided_ami is set false"
  default     = ""
}

#---------------------------------------------------------------------------------
#Any one of the below name has to be assigned based the AMI version.
#if aws_provided_ami is true assihn value to ,else assign value to customami_name
#---------------------------------------------------------------------------------

variable "ami_name" {
  description = "Name for the encrypted amazon AMI"
  default     = ""
}

variable "customami_name" {
  description = "Name for the encrypted custom AMI"
  default     = ""
}

variable "purpose" {
  description = "Purpose of this AMI. Eg: Dedicated for web tier"
}
