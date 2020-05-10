resource "vcd_network_isolated" "network" {
  count           = var.deploy ? 1 : 0
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name

  name            = var.name
  description     = var.description
  
  gateway         = var.gateway
  netmask         = var.netmask
}
