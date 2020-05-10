variable "deploy" {
  type = bool
  default = true
}

variable "region" {}

variable "name" {}

variable "description" {}

variable "network" {}

variable "egress" {
  type = list(object({
    to = string
    with_addr = string
  }))
}
