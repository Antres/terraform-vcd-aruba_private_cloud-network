output "network" {
  value = {
    name = vcd_network_isolated.network.name
    type = "vcd_network_isolated"
    #region = var.region
  }
}
