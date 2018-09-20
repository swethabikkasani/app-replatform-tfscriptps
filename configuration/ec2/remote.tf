# data "terraform_remote_state" "ssh" {
#   backend = "_local"
#
#   config = {
#     path = "../base/ssh/terraform.tfstate"
#   }
# }

data "terraform_remote_state" "ami" {
  backend = "_local"

  config = {
    path = "../ami/terraform.tfstate"
  }
}

data "terraform_remote_state" "net" {
  backend = "_local"

  config = {
    path = "../vpc/terraform.tfstate"
  }
}
