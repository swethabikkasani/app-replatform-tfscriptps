
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

variable "project_name" {
  default = "app-replatform"
}

variable "tier" {
  default = "db"
}

variable "environment" {
  default = "dev"
}

variable "db_instance_type" {
  default = "db.t2.micro"
}

variable "db_engine" {
  default = "oracle-se1"
}

variable "db_engine_version" {
  default = "11.2.0.4.v16"
}

variable "db_allocated_storage" {
  default = "20"
}

variable "db_storage_encrypted" {
  default = "false"
}

variable "db_apply_immediately" {
  default = "true"
}

variable "db_license_model" {
  default = "bring-your-own-license"
}

variable "db_database_name" {
  default = "oracledb"
}

variable "db_database_user" {
  default = "sbikkasani"
}

variable "db_database_password" {
  default = "YourPwdShouldBeLongAndSecure!"
}

variable "db_database_port" {
  default = "1521"
}

variable "db_family" {
  default = "oracle-se1-11.2"
}

variable "db_major_engine_version" {
  default = "11.2"
}

variable "db_backup_retention_period" {
  default = "0"
}

variable "db_multi_az" {
  default     = "false"
}
