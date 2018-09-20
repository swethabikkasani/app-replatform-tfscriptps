#-------------------------------------------------------------------------
#Create security group for the instance
#--------------------------------------------------------------------------

module "rdssg" {
  source      = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/sg/"
  name        = "${var.project_name}-${var.tier}-${var.environment}-rdssg"
  vpc_id      = "${data.terraform_remote_state.net.vpc_id}"
  description = "SG for ${var.project_name}-${var.environment}-RDS (Managed by terraform)"
}

#-------------------------------------------------------------------------
#Set security group rules
#--------------------------------------------------------------------------

module "rds_sg_rules" {
  source                = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/sg_rules/"
  sg_id                 = "${module.rdssg.security_group_id}"
  cidr_source           = "${var.cidr_source}"
  sg_rule_sequence      = "${var.sg_rule_sequence}"
  source_cidr_blocks    = ["${var.source_cidr_blocks}"]
  source_sg_id          = "${var.source_sg_id}"
  rule_description      = "${var.rule_description}"
}

#####
module "db" {
  source = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/rds/"

  identifier = "${var.project_name}-${var.environment}-${var.tier}-master"

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine            = "${var.db_engine}"
  engine_version    = "${var.db_engine_version}"
  instance_class    = "${var.db_instance_type}"
  allocated_storage = "${var.db_allocated_storage}"
  storage_encrypted = "${var.db_storage_encrypted}"
  apply_immediately = "${var.db_apply_immediately}"
  license_model     = "${var.db_license_model}"
  multi_az          = "${var.db_multi_az}"

  # kms_key_id        = "arm:aws:kms:<region>:<accound id>:key/<kms key id>"
  name     = "${var.db_database_name}"
  username = "${var.db_database_user}"
  password = "${var.db_database_password}"
  port     = "${var.db_database_port}"

  vpc_security_group_ids = ["${module.rdssg.security_group_id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = "${var.db_backup_retention_period}"

  tags = {
    Owner       = "${var.db_database_user}"
    Environment = "${var.environment}"
  }

  # DB subnet group
  db_subnet_group_name = "${data.terraform_remote_state.net.database_subnet_group}"

  # DB parameter group
  family = "${var.db_family}"

  # DB option group
  major_engine_version = "${var.db_major_engine_version}"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "${var.project_name}-${var.environment}-${var.tier}-master"

}
