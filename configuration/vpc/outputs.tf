#-------------------------------------------------------------------
#Output section
#-------------------------------------------------------------------
output "private-subnets" {
  value = "${module.vpc.private_subnets}"
}

output "public-subnets" {
  value = "${module.vpc.public_subnets}"
}

output "cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "database_subnet_group" {
 value = "${module.vpc.database_subnet_group}"
}
