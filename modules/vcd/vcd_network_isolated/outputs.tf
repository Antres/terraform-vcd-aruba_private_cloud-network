output "name" {
  value           = try(vcd_network_isolated.network[0].name, "")
}

output "type" {
  value           = "vcd_network_isolated"
}

output "region" {
  value           = var.region
}

output "object" {
  value           = try(vcd_network_isolated.network[0], "")
}
