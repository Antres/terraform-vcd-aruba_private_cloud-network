terraform {
  required_version          = "> 0.12.0"
  experiments               = []
}

locals {
}

module "network" {
  source = "./modules/vcd/vcd_network_isolated"
  
  region = var.region
  
  name = var.name
  gateway = cidrhost(var.network, 1)
  netmask = cidrnetmask(var.network)
}
