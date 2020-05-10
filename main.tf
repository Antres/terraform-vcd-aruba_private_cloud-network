terraform {
  required_version          = "> 0.12.0"
  experiments               = []
}

locals {
  network                   = module.network.network
  network_type              = "vcd_network_isolated"
}

module "network" {
  source                    = "./modules/vcd/${local.network_type}"
  
  region                    = var.region
  
  name                      = var.name
  description               = var.description
  
  gateway                   = cidrhost(var.network, 1)
  netmask                   = cidrnetmask(var.network)
}
