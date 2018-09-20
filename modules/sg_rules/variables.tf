variable "sg_id" {
  description = "ID of security group in which we are managing rules"
}

variable "sg_rule_sequence" {
  description = "type,from_port,to_port,protocol"
}

variable "source_cidr_blocks" {
  description = "Source/Dest CIDR blocks"
  default     = []
}

variable "source_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks"
  default     = []
}

variable "source_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints). Only valid with egress"
  default     = []
}

variable "source_sg_id" {
  description = "The security group id to allow access to/from, depending on the type"
  default     = ""
}

variable "rule_description" {
  description = "Description of the rule"
}

variable "cidr_source" {
  description = "Set it true if source/Dest is cidr not SG_ID"
}
