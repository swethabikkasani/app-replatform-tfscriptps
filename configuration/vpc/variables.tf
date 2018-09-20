variable "cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnets" {
 default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "single_nat_gateway" {
  default = "true"
}

variable "one_nat_gateway_per_az" {
  default = "false"
}

variable "environment" {
  default = "dev"
}

variable "project_name" {
  default = "App-Replatform"
}
