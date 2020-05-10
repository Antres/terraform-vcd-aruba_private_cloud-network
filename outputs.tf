output "name" {
  #value             = local.network.name
  value             = var.name
}

output "type" {
  value             = local.network.type
}

output "region" {
  value             = var.region
}

output "object" {
  value             = local.network.object
}
