output "network" {
  value = {
    name = length(vcd_network_isolated.network[*]) > 0 ? vcd_network_isolated.network[0].name : ""
    type = "vcd_network_isolated"
    region = var.region
  }
}
