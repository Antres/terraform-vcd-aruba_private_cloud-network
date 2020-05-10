resource "vcd_network_isolated" "network" {
  org = var.region.vdc.org
  vdc = var.region.vdc.name

  name    = var.name
  
  gateway = var.gateway
  netmask = var.netmask
}
