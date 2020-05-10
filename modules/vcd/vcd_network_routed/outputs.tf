output "network" {
  value = {
    name = length(vcd_network_routed.network[*]) > 0 ? vcd_network_routed.network[0].name : ""
    type = "vcd_network_routed"
    region = var.region
  }
}
