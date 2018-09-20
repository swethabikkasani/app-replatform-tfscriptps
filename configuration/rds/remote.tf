data "terraform_remote_state" "net" {
  backend = "_local"

  config = {
    path = "../vpc/terraform.tfstate"
  }
}
