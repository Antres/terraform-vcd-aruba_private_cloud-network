resource "vcd_network_routed" "network" {
  count           = var.deploy ? 1 : 0
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name

  name            = var.name
  description     = var.description
  
  gateway         = var.gateway
  netmask         = var.netmask
  
  depends_on      = [
    vcd_network_isolated.network,
  ]
}
