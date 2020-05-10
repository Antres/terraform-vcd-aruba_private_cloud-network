resource "vcd_snat" "egress" {
  count           = var.region.edge.advanced ? 0 : length(var.egress)
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name
  
  description     = "Egress SNAT for ${var.name} network"
  
  #network_type    = "ext"
  #network_name    = tolist(var.region.edge.external_network)[0].name

  internal_ip     = var.network
  external_ip     = var.egress[count.index].with_addr
}

resource "vcd_firewall_rules" "egress" {
  count           = var.region.edge.advanced ? 0 : length(var.egress)
  
  org             = var.region.vdc.org
  vdc             = var.region.vdc.name
  edge_gateway    = var.region.edge.name
  
  default_action  = "drop"
  
  dynamic "rule" {
    for_each      = var.egress
    
    content {
      description = "Egress rule for ${var.name} network"
      policy      = "allow"
      source_ip   = var.network
      source_port = "any"
      
      destination_ip  = rule.value.to
      destination_port = split("/", rule.value.ports[0])[0]
      protocol         = split("/", rule.value.ports[0])[1]
    }
  }
}
