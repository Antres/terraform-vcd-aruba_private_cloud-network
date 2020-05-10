output "network" {
  value = {
    name = length(vcd_network_isolated.network[*]) > 0 ? vcd_network_isolated.network[0].name : ""
    type = "vcd_network_isolated"
    region = var.region
  }
}

output "name" {
  value           = try(vcd_network_isolated.network[0].name, "");
}

output "type" {
  value           = "vcd_network_isolated"
}

output "region" {
  value           = var.region
}
