terraform {
  required_version          = "> 0.12.0"
  experiments               = []
}

locals {
  network                   = local.network_type == "vcd_network_isolated" ? module.vcd_network_isolated.network : tomap({"name"="", "type"=""})
  network_type              = length(var.ingress) == 0 && length(var.egress) == 0 ? "vcd_network_isolated" : "vcd_network_routed"
}

module "vcd_network_isolated" {
  source                    = "./modules/vcd/vcd_network_isolated"
  
  deploy                    = local.network_type == "vcd_network_isolated"
  region                    = var.region
  
  name                      = var.name
  description               = var.description
  
  gateway                   = cidrhost(var.network, 1)
  netmask                   = cidrnetmask(var.network)
}
