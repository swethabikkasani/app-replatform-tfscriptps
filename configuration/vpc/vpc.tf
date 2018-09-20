# ---------------------------------------------
# This helps gather AZ's for the current region
# ---------------------------------------------
data "aws_availability_zones" "available" {}

# --------------------------------------------------------------------
# This is the 'networking' module that creates the complete VPC layout
# --------------------------------------------------------------------
module "vpc" {
  source = "git::ssh://sbikkasani@bitbucket.org/sbikkasani/terraformscripts.git//modules/vpc/"
  name   = "${var.project_name}-${var.environment}"

  # ----------------------------------------------------------
  # Below variables are necessary for defining the VPC subnets
  # ----------------------------------------------------------
  azs = [
    "${data.aws_availability_zones.available.names[0]}",
    "${data.aws_availability_zones.available.names[1]}",
  ]

  cidr                   = "${var.cidr}"
  private_subnets        = ["${var.private_subnets}"]
  public_subnets         = ["${var.public_subnets}"]
  database_subnets       = ["${var.database_subnets}"]
  single_nat_gateway     = "${var.single_nat_gateway}"
  one_nat_gateway_per_az = "${var.one_nat_gateway_per_az}"

  tags = {
    "Name"        = "${var.project_name}-${var.environment}"
    "Environment" = "${var.environment}"
  }
}
