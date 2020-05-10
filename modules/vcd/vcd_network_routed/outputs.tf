output "network" {
  value = {
    name = vcd_network_routed.network[0].name
    type = "vcd_network_routed"
    region = var.region
  }
}
