terraform {
  required_version          = "> 0.12.0"
  experiments               = []
}

locals {
}

module "network" {
  source = "./modules/vcd/vcd_network_isolated"
  
  region = var.region
  
  name = "pippo"
  gateway = "192.168.0.1"
  netmask = "255.255.255.0"
}
