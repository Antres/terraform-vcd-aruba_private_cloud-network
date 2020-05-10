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

resource "vcd_nsxv_snat" "egress" {
  count           = length(var.egress)
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name
  
  network_type = "ext"
  network_name = tolist(var.region.edge.external_network)[0].name

  original_address   = var.network
  translated_address = var.egress[count.index].with_addr
}

resource "vcd_nsxv_firewall_rule" "egress" {
  count           = length(var.egress)
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name
  
  source {
    org_networks  = [var.name]
  }
  
  destination {
    ip_addresses  = [var.egress[count.index].to]
  }
  
  service {
    protocol      = "any"
  }
  
  action          = "accept"
}
