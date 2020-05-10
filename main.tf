terraform {
  required_version          = "> 0.12.0"
  experiments               = []
}

locals {
  network                   = local.network_type == "vcd_network_isolated" ? module.vcd_network_isolated.network : ""
  network_type              = "vcd_network_isolated"
}

module "vcd_network_isolated" {
  source                    = "./modules/vcd/vcd_network_isolated"
  
  region                    = var.region
  
  name                      = var.name
  description               = var.description
  
  gateway                   = cidrhost(var.network, 1)
  netmask                   = cidrnetmask(var.network)
}
