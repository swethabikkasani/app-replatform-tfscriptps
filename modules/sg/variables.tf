#################
# Security group
#################
variable "create" {
  description = "Should be true if we need to create security group"
  default     = true
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
}

variable "name" {
  description = "Name of security group"
}

variable "description" {
  description = "Description of security group"
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {}
}

variable "project_name" {
   description = "Name of the project being used"
   default = "Replatform"
}
