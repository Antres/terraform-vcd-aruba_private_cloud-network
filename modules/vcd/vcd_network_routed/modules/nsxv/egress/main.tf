resource "vcd_nsxv_snat" "egress" {
  count           = ! var.region.edge.advanced ? length(var.egress) : 0
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name
  
  description     = "Egress SNAT for ${var.name} network"
  
  network_type = "ext"
  network_name = tolist(var.region.edge.external_network)[0].name

  original_address   = var.network
  translated_address = var.egress[count.index].with_addr
}

resource "vcd_nsxv_firewall_rule" "egress" {
  count           = ! var.region.edge.advanced ? length(var.egress) : 0
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name
  
  name            = "Egress rule for ${var.name} network"
  source {
    org_networks  = [var.name]
  }
  
  destination {
    ip_addresses  = [var.egress[count.index].to]
  }

  dynamic "service" {
    for_each      = var.egress[count.index].ports
    
    content {
      port          = split("/", service.value)[0]
      protocol      = split("/", service.value)[1]
    }
  }
  
  action          = "accept"
}
