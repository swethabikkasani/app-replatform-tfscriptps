#-------------------------------------------------------------------------
#Create security group for the instance
#--------------------------------------------------------------------------

module "sg" {
  source      = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/sg/"
  name        = "${var.project_name}-${var.tier}-${var.environment}-sg"
  vpc_id      = "${data.terraform_remote_state.net.vpc_id}"
  description = "SG for ${var.project_name}-${var.environment} (Managed by terraform)"
}

module "sg_rules" {
  source = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/sg_rules/"
  sg_id = "${module.sg.security_group_id}"
  cidr_source = "${var.cidr_source}"
  sg_rule_sequence = "${var.sg_rule_sequence}"
  source_cidr_blocks      = ["${var.source_cidr_blocks}"]
  source_sg_id = "${var.source_sg_id}"
  rule_description      = "${var.rule_description}"
}

module "ec2" {
  source = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/ec2/"

  # ----------------------------------------------------------------------
  # Name to be used on all resources as prefix
  # ----------------------------------------------------------------------
  name = "${var.project_name}-${var.tier}-${var.environment}"

  # -----------------------------------------------------------------------
  # Below variables are mandatory for spinning up an instance
  # -----------------------------------------------------------------------

  instance_type               = "${var.instance_type}"
  ami                         = "${data.terraform_remote_state.ami.linux_ami_id}"
  vpc_security_group_ids      = ["${module.sg.security_group_id}"]
  subnet_id                   = "${data.terraform_remote_state.net.public-subnets[0]}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  user_data                   = "${file("userdata.sh")}"
  instance_count              = "${var.instance_count}"

}

# resource "aws_eip" "bastion" {
#   count      = "${var.eip_count}"
#   instance   = "${element(module.bastion.id, count.index)}"
#   vpc        = true
# }
