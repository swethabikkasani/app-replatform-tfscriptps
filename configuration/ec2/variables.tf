variable "environment" {
  default = "dev"
}

variable "tier" {
  default = "ec2"
}

#--------------------------------------------------------------
#Bastion host variable section
#--------------------------------------------------------------

variable "instance_type" {
  default = "t2.micro"
}

variable "eip_count" {
   default = "1"
}

variable "project_name" {
   default = "Replatform"
}

variable "key_name" {
   default = "Jenkins-KP"
}

variable "sg_rule_sequence" {
  description = "type,from_port,to_port,protocol"
}

variable "source_cidr_blocks" {
  description = "Source/Dest CIDR blocks"
  default     = ["0.0.0.0/0"]
}

variable "source_sg_id" {
  description = "The security group id to allow access to/from, depending on the type"
  default     = ""
}

variable "rule_description" {
  description = "Description of the rule"
  default = ""
}

variable "cidr_source" {
  description = "Set it true if source/Dest is cidr not SG_ID"
}

variable "instance_count" {
  description = "Number of instances to be provisioned."
  default = "1"
}
