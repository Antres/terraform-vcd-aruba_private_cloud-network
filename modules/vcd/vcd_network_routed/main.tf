terraform {
  required_version          = "> 0.12.0"
  experiments               = []
}

resource "vcd_network_routed" "network" {
  count           = var.deploy ? 1 : 0
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name

  name            = var.name
  description     = var.description
  
  gateway         = cidrhost(var.network, 1)
  netmask         = cidrnetmask(var.network)
}

module "egress" {
  source          = "./modules/nsxv/egress"
  
  deploy          = var.deploy
  
  region          = var.region
  
  name            = var.name
  description     = var.description
  network         = var.network
  
  egress          = var.egress
}
