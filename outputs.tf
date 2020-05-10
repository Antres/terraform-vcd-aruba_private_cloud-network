output "network" {
  value = {
    network         = local.network
    type            = local.network_type
  }
}

output "name" {
  value             = local.network.name
}

output "type" {
  value             = local.network.type
}

output "region" {
  value             = var.region
}
